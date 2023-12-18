/* password_creator.vala
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


namespace Parolemanager{
    [GtkTemplate (ui = "/org/gnome/parole/password_creator.ui")]
    public class Password_dialog : Adw.Window {
        [GtkChild]
        private unowned Gtk.Button saver;
        [GtkChild]
        private unowned Gtk.Entry name;
        [GtkChild]
        private unowned Gtk.Entry passwd_field;
        public signal void add_signal(Gtk.Button button, string password);

        public void create_link(){
            var new_link = new Gtk.Button();
            var buff_passwd = passwd_field.get_buffer();
            var buff_name = name.get_buffer();
            new_link.set_label(buff_name.get_text());
            string password = buff_passwd.get_text();
            add_signal(new_link, password);
            this.close();
        }

        public Password_dialog () {
            Object();
            this.saver.clicked.connect(this.create_link);
        }
    }
}
