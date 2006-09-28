/* Copyright (c) 2006, NIF File Format Library and Tools
All rights reserved.  Please see niflib.h for licence. */

#include "../../include/obj/NiTimeController.h"
#include "../../include/obj/NiObjectNET.h"
using namespace Niflib;

//Definition of TYPE constant
const Type NiTimeController::TYPE("NiTimeController", &NI_TIME_CONTROLLER_PARENT::TypeConst() );

NiTimeController::NiTimeController() NI_TIME_CONTROLLER_CONSTRUCT {}

NiTimeController::~NiTimeController() {}

void NiTimeController::Read( istream& in, list<uint> & link_stack, unsigned int version, unsigned int user_version ) {
	InternalRead( in, link_stack, version, user_version );
}

void NiTimeController::Write( ostream& out, map<NiObjectRef,uint> link_map, unsigned int version, unsigned int user_version ) const {
	InternalWrite( out, link_map, version, user_version );
}

string NiTimeController::asString( bool verbose ) const {
	return InternalAsString( verbose );
}

void NiTimeController::FixLinks( const map<unsigned,NiObjectRef> & objects, list<uint> & link_stack, unsigned int version, unsigned int user_version ) {
	InternalFixLinks( objects, link_stack, version, user_version );
}

list<NiObjectRef> NiTimeController::GetRefs() const {
	return InternalGetRefs();
}

const Type & NiTimeController::GetType() const {
	return TYPE;
};

NiTimeControllerRef NiTimeController::GetNextController() const {
	return nextController;
}

void NiTimeController::SetNextController( const NiTimeControllerRef & obj ) {
	nextController = obj;
}

void NiTimeController::SetTarget( NiObjectNET * new_target ) {
	target = new_target;
}

Ref<NiObjectNET> NiTimeController::GetTarget() {
	return target;
}

ushort NiTimeController::GetFlags() const {
	return flags;
}

void NiTimeController::SetFlags( ushort n ) {
	flags = n;
}

float NiTimeController::GetFrequency() const {
	return frequency;
}

void NiTimeController::SetFrequency( float n ) {
	frequency = n;
}

float NiTimeController::GetPhase() const {
	return phase;
}

void NiTimeController::SetPhase( float n ) {
	phase = n;
}

float NiTimeController::GetStartTime() const {
	return startTime;
}

void NiTimeController::SetStartTime( float n ) {
	startTime = n;
}

float NiTimeController::GetStopTime() const {
	return stopTime;
}

void NiTimeController::SetStopTime( float n ) {
	stopTime = n;
}