#include "script_component.hpp"
/*
 * Author: Glowbal
 * Edit: Tomcat
 * Overwrites the cprLocal of ACE to add the success chance for AED and AED-X
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Used Revive Object <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "AED"] call kat_circulation_fnc_cprLocal
 *
 * Public: No
 */

params [
	["_medic",objNull,[objNull]],
	["_patient",objNull,[objNull]],
	["_reviveObject","CPR",[""]]
];

private _medicationArray = _patient getVariable ["ace_medical_medications", []];

private _chance = 0;
private _random = random 100;
private _randomCPR = random 1;
private _epiBoost = 0;
private _CPRcount = _patient getVariable [QGVAR(CPRcount), 0];

{
    _x params ["_medication"];

    switch(_medication) do
    {
	    case "Epinephrine": {
	    _epiBoost = 1;
	    };
	};
} forEach _medicationArray;

[_patient, "activity", "STR_ACE_medical_treatment_Activity_CPR", [[_medic, false, true] call ace_common_fnc_getName]] call ace_medical_treatment_fnc_addToLog;
_chance = ace_medical_treatment_cprSuccessChance;

if (GVAR(enable_CPR_Chances)) then {
	switch (_medic getVariable ["ace_medical_medicClass",0]) do {
		case 0: {
			_chance = GVAR(CPR_Chance_Default);
		};
		case 1: {
			_chance = GVAR(CPR_Chance_RegularMedic);
		};
		case 2: {
			_chance = GVAR(CPR_Chance_Doctor);
		};
	};
};

if !(GVAR(enable_CPR_Chances)) then {
	if (_random < _chance) then {
		["ace_medical_CPRSucceeded", _patient] call CBA_fnc_localEvent;
	};
} else {
	diag_log "MANUAL CPR";

	if (_epiBoost == 1) then {
		_chance = _chance + (2 ^ _CPRcount);
		_CPRcount = _CPRcount + 1;
		_patient setVariable [QGVAR(CPRcount), _CPRcount, true];
	};

	if (_random <= _chance) then {
		["ace_medical_CPRSucceeded", _patient] call CBA_fnc_localEvent;
		_patient setVariable [QGVAR(CPRcount), 2, true];
	};
};



