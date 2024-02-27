#include "script_component.hpp"

#include "XEH_PREP.sqf.inc"
#include "initSettings.sqf.inc"

["CBA_settingsInitialized", {
	LOG("Settings initialized, enabling systems");

	// Global settings
	"CombatFormationSoft" enableAIFeature GVAR(CombatFormationSoft);
	"AwareFormationSoft" enableAIFeature GVAR(AwareFormationSoft);

	useAISteeringComponent GVAR(useAISteeringComponent);
	disableRemoteSensors GVAR(disableRemoteSensors);

	["CAManBase", "initPost", FUNC(unitInit), true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
