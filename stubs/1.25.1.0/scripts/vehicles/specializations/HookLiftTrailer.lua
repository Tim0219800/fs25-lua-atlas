---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HookLiftTrailer.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for hooklift trailers (requires AnimatedVehicle and Foldable). A reference animation (default unfoldHand) loads and unloads the container, a separate animation tips it. The script animates physics joint limits from keyframes, can create an extra joint when the container is fully lifted, controls detaching and tipping rules, drives visual rolls, hook lock visuals and foldable HUD texts, and keeps PTO power on during animations. Works with HookLiftContainer on the container side.
---@class HookLiftTrailer
HookLiftTrailer = {}

--- Returns true only if the vehicle type has both AnimatedVehicle and Foldable.
---@param specializations table
---@return boolean
function HookLiftTrailer.prerequisitesPresent(specializations) end

--- Registers the XML schema under vehicle.hookLiftTrailer: joint limit keyframes, the additional joint, unloading animation, hook lock, container lock, visual rolls and the HUD texts.
function HookLiftTrailer.initSpecialization() end

--- Registers startTipping, stopTipping, getIsTippingAllowed, getCanDetachContainer, the lock and joint update functions and setHookLiftContainerPhysicsState.
---@param vehicleType any
function HookLiftTrailer.registerFunctions(vehicleType) end

--- Overrides getIsFoldAllowed, isDetachAllowed, getDoConsumePtoPower, getPtoRpm, addToPhysics and removeFromPhysics.
---@param vehicleType any
function HookLiftTrailer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onUpdateTick, onPostAttachImplement, onPreDetachImplement and onUpdateAnimation.
---@param vehicleType any
function HookLiftTrailer.registerEventListeners(vehicleType) end

--- Loads the reference animation name, the joint-limit curves (rotation and translation min and max per key time), the additional joint settings, unloading animation, hook lock (client only), container lock, visual rolls and the localized texts. Note: the visualRoll direction default in the code is 1 while the schema declares -1.
---@param savegame table
function HookLiftTrailer:onLoad(savegame) end

--- Sets the Foldable specialization's direction texts to the unload arm and load arm labels.
---@param savegame table
function HookLiftTrailer:onPostLoad(savegame) end

--- While a container is attached, allows its detaching once the reference animation is above 0.95 and applies the interpolated joint limits to its physics joints while the animation runs, locking them once it reaches 0.99. On clients, also toggles the hook lock visual when the container's joint is close to the reference node.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HookLiftTrailer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- If the attached implement uses a hooklift joint type, records it as the attached container with its joint index and switches the foldable texts to the container labels. Then refreshes the lock state.
---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function HookLiftTrailer:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- When the carried container is detached, unlocks it, restores the arm texts, removes the additional joint and its helper transform group, and forgets the container. Then refreshes the lock state.
---@param implement integer
function HookLiftTrailer:onPreDetachImplement(implement) end

--- For the reference animation, updates the lock state and spins the visual rolls that touch the container's bottom line, by the distance moved along it. On the server, during the unloading animation, re-aims the additional joint frame.
---@param name any
function HookLiftTrailer:onUpdateAnimation(name) end

--- Plays the unloading animation forward at its configured speed from the current time, so the container tips.
function HookLiftTrailer:startTipping() end

--- Plays the unloading animation backward at the configured reverse speed from the current time.
function HookLiftTrailer:stopTipping() end

--- Returns true only when the reference animation is exactly at its start (time 0), meaning the container is fully down on the trailer.
---@return boolean
function HookLiftTrailer:getIsTippingAllowed() end

--- Returns true only when the reference animation is exactly at its end (time 1), meaning the container is fully lowered to the ground.
function HookLiftTrailer:getCanDetachContainer() end

--- Updates the container lock (true when the arm is fully loaded and a container is attached), applying object changes and notifying the container. On the server also toggles the additional joint state against its lock time.
function HookLiftTrailer:updateHookLiftContainerLockState() end

--- Creates the extra physics joint between container and trailer when it should be active and both are in physics, using the additional joint limits, or removes it and its helper node otherwise. Does nothing without an additional joint node. Assumes limits exist when creating.
function HookLiftTrailer:updateAdditionalHookLiftContainerJoint() end

--- Called when the carried container enters or leaves physics: refreshes or zeroes the stored joint index (resetting the limit lock when re-added), then updates the additional joint.
---@param container any
---@param state any
function HookLiftTrailer:setHookLiftContainerPhysicsState(container, state) end

--- After the parent, tells the carried container's physics state to true. Returns false if the parent failed.
---@param superFunc any
---@return boolean
function HookLiftTrailer:addToPhysics(superFunc) end

--- Sets the carried container's physics state to false before the parent removes the trailer. Returns false if the parent failed.
---@param superFunc any
function HookLiftTrailer:removeFromPhysics(superFunc) end

--- Refuses folding as long as the unloading animation is not at its start, otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function HookLiftTrailer:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Allows detaching the trailer (parent decision) only when the unloading animation is at 0, otherwise returns false with nil.
---@param superFunc any
---@return boolean
function HookLiftTrailer:isDetachAllowed(superFunc) end

--- Returns true if the parent does or if the reference or unloading animation is currently playing, so the arm consumes PTO power while moving.
---@param superFunc any
---@return boolean
function HookLiftTrailer:getDoConsumePtoPower(superFunc) end

--- While one of the two animations plays, returns the PTO rpm of the power consumer specialization, otherwise the parent value.
---@param superFunc any
---@return number
function HookLiftTrailer:getPtoRpm(superFunc) end
