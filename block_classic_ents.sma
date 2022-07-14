#include <amxmodx>
#include <fakemeta>

/* ~ [ Settings ] ~ */
const STRIP_ENTITIES = 9;

new game_entity[STRIP_ENTITIES][] =
{
    "func_bomb_target", "func_escapezone", "func_hostage_rescue", "func_vip_safetyzone",
    "info_bomb_target", "info_hostage_rescue","info_vip_start", "hostage_entity",
    "monster_scientist"
}

/* ~ [ AMX Mod X ] ~ */
public plugin_init()
{
    register_plugin("Remove Classic Entityes", "1.40 + 0.1", "NL)Ramon(NL \ Edit: Cristian505");
}

public plugin_precache()
{
    register_forward(FM_Spawn, "Spawn");
}

public Spawn(pent)
{
    if(pev_valid(pent))
    {
        new classname[32]; pev(pent, pev_classname, classname, 31);

        for(new i = 0; i < STRIP_ENTITIES; ++i)
        {
            if(equali(classname, game_entity[i]))
            {
                engfunc(EngFunc_RemoveEntity, pent);
                break;
            }
        }
    }
}