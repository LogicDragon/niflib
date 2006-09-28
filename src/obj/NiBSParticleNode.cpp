/* Copyright (c) 2006, NIF File Format Library and Tools
All rights reserved.  Please see niflib.h for licence. */

#include "../../include/obj/NiBSParticleNode.h"
using namespace Niflib;

//Definition of TYPE constant
const Type NiBSParticleNode::TYPE("NiBSParticleNode", &NI_B_S_PARTICLE_NODE_PARENT::TypeConst() );

NiBSParticleNode::NiBSParticleNode() NI_B_S_PARTICLE_NODE_CONSTRUCT {}

NiBSParticleNode::~NiBSParticleNode() {}

void NiBSParticleNode::Read( istream& in, list<uint> & link_stack, unsigned int version, unsigned int user_version ) {
	InternalRead( in, link_stack, version, user_version );
}

void NiBSParticleNode::Write( ostream& out, map<NiObjectRef,uint> link_map, unsigned int version, unsigned int user_version ) const {
	InternalWrite( out, link_map, version, user_version );
}

string NiBSParticleNode::asString( bool verbose ) const {
	return InternalAsString( verbose );
}

void NiBSParticleNode::FixLinks( const map<unsigned,NiObjectRef> & objects, list<uint> & link_stack, unsigned int version, unsigned int user_version ) {
	InternalFixLinks( objects, link_stack, version, user_version );
}

list<NiObjectRef> NiBSParticleNode::GetRefs() const {
	return InternalGetRefs();
}

const Type & NiBSParticleNode::GetType() const {
	return TYPE;
};
