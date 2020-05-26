#libGL error: unable to load driver: i965_dri.so

backup `/opt/android-sdk/emulator/lib64/libstdc++/libstdc++.so.6` or `/the_path_where_you_install_android_sdk/emulator/lib64/libstdc++/libstdc++.so.6`

`cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /opt/android-sdk/emulator/lib64/libstdc++/ `

Related code:

`find /usr/lib/ -name "libstdc++.so*"`
