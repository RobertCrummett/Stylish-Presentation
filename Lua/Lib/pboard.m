/* Copy strings to clip board in MAC OS
 *
 * Source: https://nathancraddock.com/blog/writing-to-the-clipboard-the-hard-way/
 * Author: R. Nate Crummett */

#import <Cocoa/Cocoa.h>

#include <lua/lua.h>
#include <lua/lauxlib.h>

int set(lua_State *L) {
    const char *str = luaL_checkstring(L, 1);

    NSPasteboard *pboard = [NSPasteboard generalPasteboard];
    [pboard clearContents];
    [pboard setString:[NSString stringWithUTF8String:str]
            forType:NSPasteboardTypeString];

    return 0;
}

const luaL_Reg fns[] = {
    { "set", set },
    { NULL, NULL },
};

int luaopen_pboard(lua_State *L) {
    luaL_newlib(L, fns);
    return 1;
}
