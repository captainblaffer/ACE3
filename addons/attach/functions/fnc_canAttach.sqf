/*
 * Author: commy2
 * Check if a unit can attach a specific item.
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: unit doing the attach (player) <OBJECT>
 * 2: Array empty or containing a string of the attachable item <ARRAY>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_attachToVehicle,_player,_args);

private ["_itemName", "_attachLimit", "_attachedObjects"];

_itemName = [_args, 0, ""] call CBA_fnc_defaultParam;
_attachLimit = [6, 1] select (_player == _attachToVehicle);
_attachedObjects = _attachToVehicle getVariable [QGVAR(Objects), []];

_ret = (canStand _player) && {alive _attachToVehicle} && {(count _attachedObjects) < _attachLimit} && {_itemName in ((itemsWithMagazines _player) + [""])};

systemChat format ["[%1] Checking = %2", _itemName, _ret ];
x = _this;
_ret
