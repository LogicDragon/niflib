// Swig module description file for a C dynamic library source file
// Generate with: swig -c++ -python -o py_wrap.cpp pyniflib.i

/* Copyright (c) 2005, NIF File Format Library and Tools
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.

   * Redistributions in binary form must reproduce the above
     copyright notice, this list of conditions and the following
     disclaimer in the documentation and/or other materials provided
     with the distribution.

   * Neither the name of the NIF File Format Library and Tools
     project nor the names of its contributors may be used to endorse
     or promote products derived from this software without specific
     prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE. */

%module niflib
%include "stl.i"
%include "std_map.i"
%include "exception.i"
%include "std_list.i"
%include "typemaps.i"

// enable string assignment in structure member functions
%typemap(in) std::string* ($*1_ltype tempstr) {
	char * temps; int templ;
 	if (PyString_AsStringAndSize($input, &temps, &templ)) return NULL;
 	tempstr = $*1_ltype(temps, templ);
 	$1 = &tempstr;
}
%typemap(out) std::string* "$result = PyString_FromStringAndSize($1->data(), $1->length());";

// we need a version of SWIG that has SWIG_CATCH_STDEXCEPT support
#if SWIG_VERSION >= 0x010322
%exception {
	try {
		$action
	}
	SWIG_CATCH_STDEXCEPT // catch std::exception
	catch (...) {
		SWIG_exception(SWIG_UnknownError, "Unknown exception");
	}
}
#endif

%{
	#include "niflib.h"
%}

template <class T> struct Key;

%template(vector_float) std::vector<float>;
%template(vector_short) std::vector<short>;
%template(vector_attr_ref) std::vector<attr_ref>;
%template(vector_blk_ref) std::vector<blk_ref>;
%template(list_blk_ref) std::list<blk_ref>;
%template(vector_Vector3) std::vector<Vector3>;
%template(vector_Color) std::vector<Color>;
%template(vector_TexCoord) std::vector<TexCoord>;
%template(vector_Triangle) std::vector<Triangle>;
%template(vector_SkinWeight) std::vector<SkinWeight>;
%template(pair_int_float) std::pair<int, float>;
%template(map_int_float) std::map<int, float>;
%template(Key_Quaternion) Key<Quaternion>;
%template(vector_Key_Quaternion) std::vector< Key<Quaternion> >;
%template(Key_Vector3) Key<Vector3>;
%template(vector_Key_Vector3D) std::vector< Key<Vector3> >;
%template(Key_float) Key<float>;
%template(vector_Key_float) std::vector< Key<float> >;
%template(Key_string) Key<std::string>;
%template(vector_Key_string) std::vector< Key<std::string> >;

%ignore Float2::operator[](int n);
%ignore Float2::operator[](int n) const;
%ignore Float3::operator[](int n);
%ignore Float3::operator[](int n) const;
%ignore Float4::operator[](int n);
%ignore Float4::operator[](int n) const;
%ignore Matrix22::operator[](int n);
%ignore Matrix22::operator[](int n) const;
%ignore Matrix33::operator[](int n);
%ignore Matrix33::operator[](int n) const;
%ignore Matrix44::operator[](int n);
%ignore Matrix44::operator[](int n) const;
%ignore blk_ref::operator[](string index);

%ignore attr_ref::operator=(int n);
%ignore attr_ref::operator=(float n);
%ignore attr_ref::operator=(Float3 & n);
%ignore attr_ref::operator=(string & n);
%ignore attr_ref::operator=(const char * n);
%ignore attr_ref::operator=(Matrix33 & n);
%ignore attr_ref::operator=(blk_ref & n);
%ignore attr_ref::operator=(TextureSource & n);
%ignore attr_ref::operator=(BoundingBox & n);
%ignore attr_ref::operator=(ConditionalInt & n);
%ignore attr_ref::operator=(Texture & n);

%ignore blk_ref::operator=(const blk_ref & rh );

%ignore attr_ref::operator int();
%ignore attr_ref::operator float();
%ignore attr_ref::operator Float3();
%ignore attr_ref::operator std::string();

%ignore attr_ref::operator Matrix33();
%ignore attr_ref::operator blk_ref();
%ignore attr_ref::operator TextureSource();
%ignore attr_ref::operator BoundingBox();
%ignore attr_ref::operator ConditionalInt();
%ignore attr_ref::operator Texture();
%ignore attr_ref::operator std::list<blk_ref>();

%ignore blk_ref::operator<<(ostream & lh, const blk_ref & rh);

%include "niflib.h"
