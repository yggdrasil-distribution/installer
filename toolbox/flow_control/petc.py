#!/usr/bin/env python

# This file is part of the Yggdrasil Installer.
#   the Yggdrasil Installer is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#   the Yggdrasil Installer is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#   You should have received a copy of the GNU General Public License along with the Yggdrasil Installer. If not, see <https://www.gnu.org/licenses/>.

# A simple press enter to continue program

def capture_untill_return() -> None:
    """Stops the program from running until a enter is pressed"""
    _ = input("Press enter to continue...\n")
    pass

if __name__ == "__main__":
    capture_untill_return()
