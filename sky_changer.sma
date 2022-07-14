#include <amxmodx>
#include <fakemeta>

/* ~ [ Settings ] ~ */
new const g_sky[][] =
{
    "map_name"
};

/* ~ [ AMX Mod X ] ~ */
public plugin_init()
{
    register_plugin("Sky Changer", "2.0", "CryWolf / Edit: Cristian505");
}
 
public plugin_precache()
{
    for(new i = 0; i < sizeof g_sky; i++)
    {
        static dir[160];

        formatex(dir, charsmax(dir), "gfx/env/%sbk.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);

        formatex(dir, charsmax(dir), "gfx/env/%sdn.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);

        formatex(dir, charsmax(dir), "gfx/env/%sft.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);

        formatex(dir, charsmax(dir), "gfx/env/%slf.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);

        formatex(dir, charsmax(dir), "gfx/env/%srt.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);

        formatex(dir, charsmax(dir), "gfx/env/%sup.tga", g_sky[i]);
        engfunc(EngFunc_PrecacheGeneric, dir);
    }
    
    server_cmd("sv_skyname %s", g_sky[random_num(0, charsmax(g_sky))]);
}