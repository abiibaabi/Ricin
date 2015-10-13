[GtkTemplate (ui="/chat/tox/Ricin/main-window.ui")]
public class Ricin.MainWindow : Gtk.ApplicationWindow {
  [GtkChild] Gtk.Entry entry_name;
  [GtkChild] Gtk.Entry entry_mood;
  [GtkChild] Gtk.ListBox friendlist;
  [GtkChild] Gtk.Image connection_image;
  [GtkChild] Gtk.Label id_label;
  [GtkChild] Gtk.Stack chat_stack;


  private ListStore friends = new ListStore (typeof (Tox.Friend));

  Tox.Tox tox;

  public MainWindow (Ricin app) {
    Object (application: app);

    this.friendlist.bind_model (this.friends, fr => new FriendListRow (fr as Tox.Friend));
    this.friendlist.row_activated.connect ((lb, row) => {
      var fr = (row as FriendListRow).fr;
      foreach (var view in chat_stack.get_children ()) {
        if ((view as ChatView).fr == fr) {
          chat_stack.set_visible_child (view);
          break;
        }
      }
    });

    var options = Tox.Options.create ();
    options.ipv6_enabled = true;
    options.udp_enabled = true;
    this.tox = new Tox.Tox (options);

    this.tox.set_username (this.entry_name.get_text ());
    this.tox.set_mood (this.entry_mood.get_text ());

    id_label.label += this.tox.id;

    this.entry_name.key_press_event.connect ((event) => {
      if (
        event.keyval == Gdk.Key.Return ||
        event.keyval == Gdk.Key.ISO_Enter ||
        event.keyval == Gdk.Key.KP_Enter
      ) {
        this.tox.set_username (this.entry_name.get_text ());
      }
      return true;
    });

    this.entry_mood.key_press_event.connect ((event) => {
      if (
        event.keyval == Gdk.Key.Return ||
        event.keyval == Gdk.Key.ISO_Enter ||
        event.keyval == Gdk.Key.KP_Enter
      ) {
        this.tox.set_mood (this.entry_mood.get_text ());
      }
      return true;
    });

    this.tox.notify["connected"].connect ((src, prop) => {
      this.connection_image.icon_name = this.tox.connected ? "gtk-yes" : "gtk-no";
    });

    this.tox.friend_request.connect ((id, message) => {
      var dialog = new Gtk.MessageDialog (this, Gtk.DialogFlags.MODAL, Gtk.MessageType.QUESTION, Gtk.ButtonsType.NONE, "Friend Request\nID: %s\n%s", id, message);
      dialog.add_buttons ("Accept", Gtk.ResponseType.ACCEPT, "Reject", Gtk.ResponseType.REJECT);
      dialog.response.connect (response => {
        if (response == Gtk.ResponseType.ACCEPT) {
          var friend = tox.accept_friend_request (id);
          if (friend != null) {
            friends.append (friend);
            chat_stack.add_named (new ChatView (this.tox, friend), friend.name);
          }
        }
        dialog.destroy ();
      });
      dialog.show ();
    });

    this.tox.run_loop ();

    this.show_all ();
  }
}
