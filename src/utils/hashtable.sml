(* newhashtable the signature *)
(*
$Log: hashtable.sml,v $
Revision 1.8  1997/05/01 12:57:09  jont
[Bug #30088]
Get rid of MLWorks.Option

 *  Revision 1.7  1996/10/03  09:36:20  matthew
 *  Generalizing type of map
 *
 *  Revision 1.6  1996/02/26  12:05:21  jont
 *  new unit
 *  Renamed from newhashtable
 *
Revision 1.7  1992/09/22  13:04:50  clive
Needed to make some type variables weak

Revision 1.6  1992/09/22  09:02:21  clive
Changed hashtables to a single structure implementation

Revision 1.5  1992/09/16  09:44:50  clive
Added tryLookup

Revision 1.4  1992/09/14  13:44:43  jont
Added a lookup_default function to assign a default value when the
key is not found

Revision 1.3  1992/08/13  16:16:25  davidt
Added fold and iterate functions.

Revision 1.2  1992/07/24  11:35:12  clive
Added some functionality including the printing of statistics, and resizing

Revision 1.1  1992/07/16  11:05:48  jont
Initial revision

Copyright (c) 1992 Harlequin Ltd.
*)

signature HASHTABLE =
  sig
    type ('_Key,'_Value) HashTable
    exception Lookup 
    val new     : int * ('_Key * '_Key -> bool) * ('_Key -> int) -> ('_Key,'_Value) HashTable
    val lookup  : (('_Key,'_Value) HashTable * '_Key) -> '_Value
    val lookup_default  : (('_Key,'_Value) HashTable * '_Value * '_Key) -> '_Value
    val tryLookup : (('_Key,'_Value) HashTable * '_Key) -> '_Value option
    val update  : (('_Key,'_Value) HashTable * '_Key * '_Value) -> unit
    val delete  : (('_Key,'_Value) HashTable * '_Key) -> unit
    val to_list : ('_Key,'_Value) HashTable -> ('_Key * '_Value) list
    val copy    : ('_Key,'_Value) HashTable -> ('_Key,'_Value) HashTable
    val map     : ('_Key * '_Value1 -> '_Value2) -> ('_Key,'_Value1) HashTable -> ('_Key,'_Value2) HashTable
    val fold    : ('a * '_Key * '_Value -> 'a) -> ('a * ('_Key,'_Value) HashTable) -> 'a
    val iterate : ('_Key * '_Value -> unit) -> ('_Key,'_Value) HashTable -> unit
    val stats : ('_Key,'_Value) HashTable -> {size:int, count:int, smallest:int, largest:int}
    val string_hash_table_stats : ('_Key,'_Value) HashTable -> string
  end