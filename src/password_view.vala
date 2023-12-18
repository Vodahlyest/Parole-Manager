/* password_view.vala
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
    [GtkTemplate (ui = "/org/gnome/parole/password_view.ui")]
    public class PasswordView : Adw.Window{
        [GtkChild]
        private unowned Gtk.Entry label_field;
        [GtkChild]
        private unowned Gtk.Entry passwd_field;

        construct{
            label_field.set_sensitive(false);
            passwd_field.set_sensitive(false);
        }

        public void set_label(string lbl){
            var lbl_buffer = label_field.get_buffer();
            uint8[] label = lbl.data;
            lbl_buffer.set_text(label);
            label_field.set_buffer(lbl_buffer);
        }

        public void set_password(string passwd){
            var passwd_buffer = passwd_field.get_buffer();
            uint8[] password = passwd.data;
            passwd_buffer.set_text(password);
            passwd_field.set_buffer(passwd_buffer);
        }
        public PasswordView(){
            Object();
        }
    }
}
