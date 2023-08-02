#[[
	//find the gtk3 library to get to know what actual name is. 
	//The result libgtk-3.dylib which means the name is gtk-3s

	$ find /usr -name *gtk*so

     ======  GTK3 ==========
    GTK3_LIBRARY and GTK3_INCLUDE_DIR variables to store the result. 
    /usr/local/Cellar/gtk+3/3.24.29/lib/libgtk-3.0.dylib
    /usr/local/Cellar/gtk+3/3.24.29/lib/libgtk-3.dylib
    /usr/local/lib/libgtk-3.0.dylib
    /usr/local/lib/libgtk-3.dylib
    /usr/local/include/gtk-3.0
]]#
find_library(GTK3_LIBRARY
		NAMES gtk-3)

#[[
	HINTS path is not added since the /usr/local/include is default location to search on by CMake.

	//find the gtk header.

	$ find /usr -name gtk.h

	====== gtk.h=======
	/usr/local/include/gtk-3.0/gtk/gtk.h
]]#
find_path(GTK3_INCLUDE_DIR
		NAMES gtk/gtk.h
		PATH_SUFFIXES gtk-3.0)

# $ find /usr -name glib.h
# /usr/local/Cellar/glib/2.68.2/include/glib-2.0/glib.h
find_path(GLIB_INCLUDE_DIR
		NAMES glib.h
		PATH_SUFFIXES glib-2.0)

# MacOS => /usr/local/Cellar/glib/2.68.2/lib/glib-2.0/include/glibconfig.h
# find_path(GLIBCONFIG_INCLUDE_DIR
# 		NAMES glibconfig.h
# 		HINTS /usr/local/Cellar/glib/2.68.2/lib/
# 		PATH_SUFFIXES glib-2.0/include) 

# Ubuntu => /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h
find_path(GLIBCONFIG_INCLUDE_DIR
		NAMES glibconfig.h
		HINTS /usr/lib/x86_64-linux-gnu/
		PATH_SUFFIXES glib-2.0/include) 

# /usr/local/Cellar/pango/1.48.5/include/pango-1.0/pango/pango.h
find_path(PANGO_INCLUDE_DIR
		NAMES pango/pango.h
		PATH_SUFFIXES pango-1.0)

# /usr/local/Cellar/harfbuzz/2.8.1/include/harfbuzz/hb.h
find_path(HARFBUZZ_INCLUDE_DIR
		NAMES hb.h
		PATH_SUFFIXES harfbuzz)

# /usr/local/Cellar/cairo/1.16.0_5/include/cairo/cairo.h
find_path(CAIRO_INCLUDE_DIR
		NAMES cairo.h
		PATH_SUFFIXES cairo)
		
# /usr/local/Cellar/gdk-pixbuf/2.42.6/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h
find_path(GDK_PIXBUF_INCLUDE_DIR
		NAMES gdk-pixbuf/gdk-pixbuf.h
		PATH_SUFFIXES gdk-pixbuf-2.0)

# /usr/local/Cellar/atk/2.36.0/include/atk-1.0/atk/atk.h
find_path(ATK_INCLUDE_DIR
		NAMES atk/atk.h
		PATH_SUFFIXES atk-1.0)



#[[
	jika message error dari CMake/Make tidak jelas lib mana yang kurang saat linking, 
	maka untuk mencari lib mana yg perlu di link, google dependency dari lib (GTK+3) yang kita pakai
]]#		
find_library(GIO_LIBRARY
		NAMES gio-2.0)

find_library(GOBJECT_LIBRARY
		NAMES gobject-2.0)

#[[
	untuk menvalidasi/mengecek dan memastikan semua variables diatas di set, 
	kita dapat melakukan pengecekan dengan memanggil fungsi find_package_handle_standard_args.
	find_package_handle_standard_args didefine dalam module FindPackageHandleStandardArgs.cmake
	Sehingga kita perlu meng-include FindPackageHandleStandardArgs
]]#
include(FindPackageHandleStandardArgs)

#[[
	Memanggil fungsi
	Argumen ke-1 adalah nama dari package.
	Argumen ke-2 adalah error message yang akan ditampilkan.
	Argumen berikutnya adalah nama variables yang akan dicek apakah semua di set nilainya.
]]#
find_package_handle_standard_args(GTK3 DEFAULT_MSG
	GTK3_LIBRARY 
	GIO_LIBRARY 
	GOBJECT_LIBRARY
	GTK3_INCLUDE_DIR 
	GLIB_INCLUDE_DIR 
	GLIBCONFIG_INCLUDE_DIR
	PANGO_INCLUDE_DIR 
	HARFBUZZ_INCLUDE_DIR
	CAIRO_INCLUDE_DIR 
	GDK_PIXBUF_INCLUDE_DIR 
	ATK_INCLUDE_DIR)

# Jika pengecekan berhasil, CMake akan secara otomatis mengeset <PackageName>_FOUND (GTK3_FOUND) = TRUE
if(GTK3_FOUND)
    set(GTK3_INCLUDE_DIRS  
		${GTK3_INCLUDE_DIR}  
		${GLIB_INCLUDE_DIR} 
		${GLIBCONFIG_INCLUDE_DIR}
		${PANGO_INCLUDE_DIR}  
		${HARFBUZZ_INCLUDE_DIR}
		${CAIRO_INCLUDE_DIR} 
		${GDK_PIXBUF_INCLUDE_DIR} 
		${ATK_INCLUDE_DIR})
		
    set(GTK3_LIBRARIES  
		${GTK3_LIBRARY} 
		${GIO_LIBRARY} 
		${GOBJECT_LIBRARY})

endif()








