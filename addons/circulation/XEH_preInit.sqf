#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#define CBA_SETTINGS_CAT "ACE Pharmacy"

[
    QGVAR(enable),
    "CHECKBOX",
    LLSTRING(SETTING_ENABLE),
    CBA_SETTINGS_CAT,
    [true],
    true
] call CBA_Settings_fnc_init;

//location for AED - Defi:
[
	QGVAR(naloxoneActive),
	"CHECKBOX",
	[LLSTRING(NALOXONE_ACTIVE)],
	CBA_SETTINGS_CAT,
	[true],
	true
] call CBA_Settings_fnc_init;

//Activate Naloxone
[
    QGVAR(naloxoneActive),
    "CHECKBOX",
    [LLSTRING(NALOXONE_ACTIVE)],
    CBA_SETTINGS_CAT,
    [true],
    true
] call CBA_Settings_fnc_init;

//Activate Carbonate
[
    QGVAR(carbonateActive),
    "CHECKBOX",
    [LLSTRING(CARBONATE_ACTIVE)],
    CBA_SETTINGS_CAT,
    [true],
    true
] call CBA_Settings_fnc_init;

//Activate TXA
[
    QGVAR(txaActive),
    "CHECKBOX",
    [LLSTRING(TXA_ACTIVE)],
    CBA_SETTINGS_CAT,
    [true],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(naloApp),
    "SLIDER",
    [LLSTRING(NALOXONE_TIME)],
    CBA_SETTINGS_CAT,
    [0.1, 10, 5, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(carboApp),
    "SLIDER",
    [LLSTRING(CARBONATE_TIME)],
    CBA_SETTINGS_CAT,
    [0.1, 10, 5, 1],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(IVestablish),
    "SLIDER",
    [LLSTRING(IV_TIME)],
    CBA_SETTINGS_CAT,
    [0.1, 10, 7, 1],
    true
] call CBA_Settings_fnc_init;

//Enable different CPR chances per medical level
[
    QGVAR(enable_CPR_Chances),
    "CHECKBOX",
    LLSTRING(SETTING_CPR_CHANCES),
    CBA_SETTINGS_CAT,
    [true],
    true
] call CBA_Settings_fnc_init;

//CPR Chance for Doctors
[
	QGVAR(CPR_Chance_Doctor),
	"SLIDER",
	LLSTRING(SETTING_CPR_CHANCE_DOCTOR),
	CBA_SETTINGS_CAT,
	[0,100,40,0],
	true
] call CBA_Settings_fnc_init;

//CPR Chance for Regular medics
[
	QGVAR(CPR_Chance_RegularMedic),
	"SLIDER",
	LLSTRING(SETTING_CPR_CHANCE_REGULARMEDIC),
	CBA_SETTINGS_CAT,
	[0,100,30,0],
	true
] call CBA_Settings_fnc_init;

//CPR Chance for Default
[
	QGVAR(CPR_Chance_Default),
	"SLIDER",
	LLSTRING(SETTING_CPR_CHANCE_DEFAULT),
	CBA_SETTINGS_CAT,
	[0,100,20,0],
	true
] call CBA_Settings_fnc_init;

ADDON = true;
