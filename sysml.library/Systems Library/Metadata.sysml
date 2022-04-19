/**
 * This package defines the base types for metadata definitions and related 
 * metadata annotations in the SysML language.
 */
package Metadata {
	private import Metaobjects::Metaobject;
	private import Metaobjects::metaobjects;
	private import Items::Item;
	private import Items::items;
	
	/**
	 * MetadataItem is the most general class of Items that represent Metaobjects. 
	 * MetadataItem is the base type of all MetadataDefinitions.
	 */
	abstract metadata def MetadataItem :> Metaobject, Item;
	
	/**
	 * metadataItems is the base feature of all MetadataUsages.
	 * 
	 * Note: It is not itself a MetadataUsage, because it is not being used as an
	 * AnnotatingElement here.
	 */
	abstract item metadataItems : MetadataItem[0..*] :> metaobjects, items;
}