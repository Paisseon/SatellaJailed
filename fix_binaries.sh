#!/bin/dash
install_name_tool -change /Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate @executable_path/Frameworks/CydiaSubstrate.framework/CydiaSubstrate Satella.dylib 2>/dev/null
install_name_tool -change /Library/Frameworks/Orion.framework/Orion @executable_path/Frameworks/Orion.framework/Orion Satella.dylib 2>/dev/null