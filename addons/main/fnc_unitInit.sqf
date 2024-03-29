#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Internal Function: ARC_MISC_difficulty_fnc_unitInit

Description:
	Initializes AI settings for a unit and/or group

Parameters:
	_unit - Initialized unit [Object]

Author:
	Freddo
---------------------------------------------------------------------------- */

params ["_unit"];
if (!local _unit) exitWith {};

// Init unit
if (
	GVAR(enabled) && {_unit getVariable [QGVAR(enabled), true]} && {!(_unit getVariable [QGVAR(initialized), false])}) then {
	LOG_1("Setting AI skills on unit",_unit);

	{
		TRACE_2("Setting skill on unit",(_x # 0),(_x # 1));

		private _randomModifier = 1 - random GVAR(randomSkill) + random GVAR(randomSkill);
		_unit setSkill [_x # 0, (_x # 1) * _randomModifier];

	} forEach [
		["aimingAccuracy", GVAR(aimingAccuracy)],
		["aimingSpeed", GVAR(aimingSpeed)],
		["commanding", GVAR(commanding)],
		["courage", GVAR(courage)],
		["endurance", GVAR(endurance)],
		["general", GVAR(general)],
		["reloadSpeed", GVAR(reloadSpeed)],
		["spotDistance", GVAR(spotDistance)],
		["spotTime", GVAR(spotTime)],
		["aimingShake", GVAR(aimingShake)]
	];
};
_unit setVariable [QGVAR(initialized), true, true];

nil
