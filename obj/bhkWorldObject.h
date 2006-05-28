/* Copyright (c) 2006, NIF File Format Library and Tools
All rights reserved.  Please see niflib.h for licence. */

#ifndef _BHKWORLDOBJECT_H_
#define _BHKWORLDOBJECT_H_

#include "xml_extract.h"
#include BHK_WORLD_OBJECT_INCLUDE

/*
 * bhkWorldObject
 */

class bhkWorldObject;
typedef Ref<bhkWorldObject> bhkWorldObjectRef;

class bhkWorldObject : public BHK_WORLD_OBJECT_PARENT {
public:
	bhkWorldObject();
	~bhkWorldObject();
	//Run-Time Type Information
	static const Type TYPE;
	virtual void Read( istream& in, list<uint> link_stack, unsigned int version );
	virtual void Write( ostream& out, map<NiObjectRef,uint> link_map, unsigned int version ) const;
	virtual string asString( bool verbose = false ) const;
	virtual void FixLinks( const vector<NiObjectRef> & objects, list<uint> link_stack, unsigned int version );
private:
	BHK_WORLD_OBJECT_MEMBERS
};
#endif