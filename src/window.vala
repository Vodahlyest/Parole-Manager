/* window.vala
 *
 * Copyright 2023 Daniil Pavlov
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

using Gee;
namespace Parolemanager {
    [GtkTemplate (ui = "/org/gnome/parole/window.ui")]
    public class Window : Adw.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Box passwd_container;
        private ArrayList<Gtk.Button> password_link;
        private HashMap<string, string> password_dict;
        construct{
            password_link = new ArrayList<Gtk.Button> ();
            password_dict = new HashMap<string, string>();
        }

        public void add_link(Gtk.Button link, string password){
            password_dict.set(link.get_label(), password);
            password_link.add(link);
            this.passwd_container.append(password_link[password_link.size - 1]);
            link.clicked.connect(() => {
                var view = new PasswordView();
                string label = link.get_label();
                view.set_label(label);
                view.set_password(password_dict[label]);
                view.show();
            });
        }

        public void new_passwd(){
            var dialog = new Password_dialog();
            dialog.show();
            dialog.add_signal.connect(this.add_link);
        }

        public Window (Gtk.Application app) {
            Object (application: app);
            var add_action = new SimpleAction ("add_password", null);
            add_action.activate.connect (this.new_passwd);
            this.add_action (add_action);
        }
    }
}
