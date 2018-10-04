//
//  Things3Glue.swift
//  Things3.app 3.7.1
//  SwiftAutomation.framework 0.1.0
//  `aeglue -S 'Things3.app'`
//


import Foundation
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(applicationClassName: "Things3",
                                                     classNamePrefix: "THI",
                                                     typeNames: [
                                                                     0x61637464: "activationDate", // "actd"
                                                                     0x616c6973: "alias", // "alis"
                                                                     0x2a2a2a2a: "anything", // "****"
                                                                     0x63617070: "application", // "capp"
                                                                     0x62756e64: "applicationBundleID", // "bund"
                                                                     0x7369676e: "applicationSignature", // "sign"
                                                                     0x6170726c: "applicationURL", // "aprl"
                                                                     0x61707220: "April", // "apr\0x20"
                                                                     0x74736161: "area", // "tsaa"
                                                                     0x61736b20: "ask", // "ask\0x20"
                                                                     0x61756720: "August", // "aug\0x20"
                                                                     0x62657374: "best", // "best"
                                                                     0x626d726b: "bookmarkData", // "bmrk"
                                                                     0x626f6f6c: "boolean", // "bool"
                                                                     0x71647274: "boundingRectangle", // "qdrt"
                                                                     0x70626e64: "bounds", // "pbnd"
                                                                     0x7464636c: "canceled", // "tdcl"
                                                                     0x636e6364: "cancellationDate", // "cncd"
                                                                     0x63617365: "case_", // "case"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x68636c62: "closeable", // "hclb"
                                                                     0x636f6c70: "collapsed", // "colp"
                                                                     0x6c77636c: "collating", // "lwcl"
                                                                     0x636c7274: "colorTable", // "clrt"
                                                                     0x7464636d: "completed", // "tdcm"
                                                                     0x636d7064: "completionDate", // "cmpd"
                                                                     0x656e756d: "constant", // "enum"
                                                                     0x636e7474: "contact", // "cntt"
                                                                     0x7473706e: "contact", // "tspn"
                                                                     0x6c776370: "copies", // "lwcp"
                                                                     0x63726564: "creationDate", // "cred"
                                                                     0x74646173: "dashStyle", // "tdas"
                                                                     0x74647461: "data", // "tdta"
                                                                     0x6c647420: "date", // "ldt\0x20"
                                                                     0x64656320: "December", // "dec\0x20"
                                                                     0x6465636d: "decimalStruct", // "decm"
                                                                     0x6c776474: "detailed", // "lwdt"
                                                                     0x64696163: "diacriticals", // "diac"
                                                                     0x636f6d70: "doubleInteger", // "comp"
                                                                     0x64756564: "dueDate", // "dued"
                                                                     0x656e6373: "encodedString", // "encs"
                                                                     0x6c776c70: "endingPage", // "lwlp"
                                                                     0x45505320: "EPSPicture", // "EPS\0x20"
                                                                     0x6c776568: "errorHandling", // "lweh"
                                                                     0x65787061: "expansion", // "expa"
                                                                     0x65787465: "extendedReal", // "exte"
                                                                     0x6661786e: "faxNumber", // "faxn"
                                                                     0x66656220: "February", // "feb\0x20"
                                                                     0x66737266: "fileRef", // "fsrf"
                                                                     0x66737320: "fileSpecification", // "fss\0x20"
                                                                     0x6675726c: "fileURL", // "furl"
                                                                     0x66697864: "fixed", // "fixd"
                                                                     0x66706e74: "fixedPoint", // "fpnt"
                                                                     0x66726374: "fixedRectangle", // "frct"
                                                                     0x66726920: "Friday", // "fri\0x20"
                                                                     0x70697366: "frontmost", // "pisf"
                                                                     0x47494666: "GIFPicture", // "GIFf"
                                                                     0x63677478: "graphicText", // "cgtx"
                                                                     0x68797068: "hyphens", // "hyph"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x70696478: "index", // "pidx"
                                                                     0x6c6f6e67: "integer", // "long"
                                                                     0x69747874: "internationalText", // "itxt"
                                                                     0x696e746c: "internationalWritingCode", // "intl"
                                                                     0x636f626a: "item", // "cobj"
                                                                     0x69647473: "itemDetails", // "idts"
                                                                     0x6a616e20: "January", // "jan\0x20"
                                                                     0x4a504547: "JPEGPicture", // "JPEG"
                                                                     0x6a756c20: "July", // "jul\0x20"
                                                                     0x6a756e20: "June", // "jun\0x20"
                                                                     0x6b706964: "kernelProcessID", // "kpid"
                                                                     0x6b736874: "keyboardShortcut", // "ksht"
                                                                     0x6c64626c: "largeReal", // "ldbl"
                                                                     0x6c697374: "list", // "list"
                                                                     0x74736c73: "list_", // "tsls"
                                                                     0x696e736c: "locationReference", // "insl"
                                                                     0x6c667864: "longFixed", // "lfxd"
                                                                     0x6c667074: "longFixedPoint", // "lfpt"
                                                                     0x6c667263: "longFixedRectangle", // "lfrc"
                                                                     0x6c706e74: "longPoint", // "lpnt"
                                                                     0x6c726374: "longRectangle", // "lrct"
                                                                     0x6d616368: "machine", // "mach"
                                                                     0x6d4c6f63: "machineLocation", // "mLoc"
                                                                     0x706f7274: "machPort", // "port"
                                                                     0x6d617220: "March", // "mar\0x20"
                                                                     0x6d617920: "May", // "may\0x20"
                                                                     0x69736d6e: "minimizable", // "ismn"
                                                                     0x706d6e64: "minimized", // "pmnd"
                                                                     0x6d6f6464: "modificationDate", // "modd"
                                                                     0x6d6f6e20: "Monday", // "mon\0x20"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e6f2020: "no", // "no\0x20\0x20"
                                                                     0x6e6f7465: "notes", // "note"
                                                                     0x6e6f7620: "November", // "nov\0x20"
                                                                     0x6e756c6c: "null", // "null"
                                                                     0x6e756d65: "numericStrings", // "nume"
                                                                     0x6f637420: "October", // "oct\0x20"
                                                                     0x7464696f: "open", // "tdio"
                                                                     0x6c776c61: "pagesAcross", // "lwla"
                                                                     0x6c776c64: "pagesDown", // "lwld"
                                                                     0x70746167: "parentTag", // "ptag"
                                                                     0x50494354: "PICTPicture", // "PICT"
                                                                     0x74706d6d: "pixelMapRecord", // "tpmm"
                                                                     0x51447074: "point", // "QDpt"
                                                                     0x70736574: "printSettings", // "pset"
                                                                     0x70736e20: "processSerialNumber", // "psn\0x20"
                                                                     0x74737074: "project", // "tspt"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x70726f70: "property_", // "prop"
                                                                     0x70756e63: "punctuation", // "punc"
                                                                     0x646f7562: "real", // "doub"
                                                                     0x7265636f: "record", // "reco"
                                                                     0x6f626a20: "reference", // "obj\0x20"
                                                                     0x7072737a: "resizable", // "prsz"
                                                                     0x74723136: "RGB16Color", // "tr16"
                                                                     0x74723936: "RGB96Color", // "tr96"
                                                                     0x63524742: "RGBColor", // "cRGB"
                                                                     0x74726f74: "rotation", // "trot"
                                                                     0x73617420: "Saturday", // "sat\0x20"
                                                                     0x73637074: "script", // "scpt"
                                                                     0x74736c74: "selectedToDo", // "tslt"
                                                                     0x73657020: "September", // "sep\0x20"
                                                                     0x73686f72: "shortInteger", // "shor"
                                                                     0x73696e67: "smallReal", // "sing"
                                                                     0x6c777374: "standard", // "lwst"
                                                                     0x6c776670: "startingPage", // "lwfp"
                                                                     0x74647374: "status", // "tdst"
                                                                     0x54455854: "string", // "TEXT"
                                                                     0x7374796c: "styledClipboardText", // "styl"
                                                                     0x53545854: "styledText", // "STXT"
                                                                     0x73756e20: "Sunday", // "sun\0x20"
                                                                     0x74737467: "tag", // "tstg"
                                                                     0x746e616d: "tagNames", // "tnam"
                                                                     0x74727072: "targetPrinter", // "trpr"
                                                                     0x74737479: "textStyleInfo", // "tsty"
                                                                     0x74687520: "Thursday", // "thu\0x20"
                                                                     0x54494646: "TIFFPicture", // "TIFF"
                                                                     0x7473746b: "toDo", // "tstk"
                                                                     0x74756520: "Tuesday", // "tue\0x20"
                                                                     0x74797065: "typeClass", // "type"
                                                                     0x75747874: "UnicodeText", // "utxt"
                                                                     0x75636f6d: "unsignedDoubleInteger", // "ucom"
                                                                     0x6d61676e: "unsignedInteger", // "magn"
                                                                     0x75736872: "unsignedShortInteger", // "ushr"
                                                                     0x75743136: "UTF16Text", // "ut16"
                                                                     0x75746638: "UTF8Text", // "utf8"
                                                                     0x76657273: "version", // "vers"
                                                                     0x70766973: "visible", // "pvis"
                                                                     0x77656420: "Wednesday", // "wed\0x20"
                                                                     0x77686974: "whitespace", // "whit"
                                                                     0x6377696e: "window", // "cwin"
                                                                     0x70736374: "writingCode", // "psct"
                                                                     0x79657320: "yes", // "yes\0x20"
                                                                     0x69737a6d: "zoomable", // "iszm"
                                                                     0x707a756d: "zoomed", // "pzum"
                                                     ],
                                                     propertyNames: [
                                                                     0x61637464: "activationDate", // "actd"
                                                                     0x74736161: "area", // "tsaa"
                                                                     0x70626e64: "bounds", // "pbnd"
                                                                     0x636e6364: "cancellationDate", // "cncd"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x68636c62: "closeable", // "hclb"
                                                                     0x636f6c70: "collapsed", // "colp"
                                                                     0x6c77636c: "collating", // "lwcl"
                                                                     0x636d7064: "completionDate", // "cmpd"
                                                                     0x636e7474: "contact", // "cntt"
                                                                     0x6c776370: "copies", // "lwcp"
                                                                     0x63726564: "creationDate", // "cred"
                                                                     0x64756564: "dueDate", // "dued"
                                                                     0x6c776c70: "endingPage", // "lwlp"
                                                                     0x6c776568: "errorHandling", // "lweh"
                                                                     0x6661786e: "faxNumber", // "faxn"
                                                                     0x70697366: "frontmost", // "pisf"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x70696478: "index", // "pidx"
                                                                     0x6b736874: "keyboardShortcut", // "ksht"
                                                                     0x69736d6e: "minimizable", // "ismn"
                                                                     0x706d6e64: "minimized", // "pmnd"
                                                                     0x6d6f6464: "modificationDate", // "modd"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e6f7465: "notes", // "note"
                                                                     0x6c776c61: "pagesAcross", // "lwla"
                                                                     0x6c776c64: "pagesDown", // "lwld"
                                                                     0x70746167: "parentTag", // "ptag"
                                                                     0x74737074: "project", // "tspt"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x7072737a: "resizable", // "prsz"
                                                                     0x6c776670: "startingPage", // "lwfp"
                                                                     0x74647374: "status", // "tdst"
                                                                     0x746e616d: "tagNames", // "tnam"
                                                                     0x74727072: "targetPrinter", // "trpr"
                                                                     0x76657273: "version", // "vers"
                                                                     0x70766973: "visible", // "pvis"
                                                                     0x69737a6d: "zoomable", // "iszm"
                                                                     0x707a756d: "zoomed", // "pzum"
                                                     ],
                                                     elementsNames: [
                                                                     0x63617070: "applications", // "capp"
                                                                     0x74736161: "areas", // "tsaa"
                                                                     0x7473706e: "contacts", // "tspn"
                                                                     0x636f626a: "items", // "cobj"
                                                                     0x74736c73: "lists", // "tsls"
                                                                     0x74737074: "projects", // "tspt"
                                                                     0x74736c74: "selectedToDos", // "tslt"
                                                                     0x74737467: "tags", // "tstg"
                                                                     0x7473746b: "toDos", // "tstk"
                                                                     0x6377696e: "windows", // "cwin"
                                                     ])

private let _glueClasses = SwiftAutomation.GlueClasses(insertionSpecifierType: THIInsertion.self,
                                       objectSpecifierType: THIItem.self,
                                       multiObjectSpecifierType: THIItems.self,
                                       rootSpecifierType: THIRoot.self,
                                       applicationType: Things3.self,
                                       symbolType: THISymbol.self,
                                       formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on Things3.app terminology

public class THISymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "THI"}

    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> THISymbol {
        switch (code) {
        case 0x61637464: return self.activationDate // "actd"
        case 0x616c6973: return self.alias // "alis"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x63617070: return self.application // "capp"
        case 0x62756e64: return self.applicationBundleID // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationURL // "aprl"
        case 0x61707220: return self.April // "apr\0x20"
        case 0x74736161: return self.area // "tsaa"
        case 0x61736b20: return self.ask // "ask\0x20"
        case 0x61756720: return self.August // "aug\0x20"
        case 0x62657374: return self.best // "best"
        case 0x626d726b: return self.bookmarkData // "bmrk"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x70626e64: return self.bounds // "pbnd"
        case 0x7464636c: return self.canceled // "tdcl"
        case 0x636e6364: return self.cancellationDate // "cncd"
        case 0x63617365: return self.case_ // "case"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x68636c62: return self.closeable // "hclb"
        case 0x636f6c70: return self.collapsed // "colp"
        case 0x6c77636c: return self.collating // "lwcl"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x7464636d: return self.completed // "tdcm"
        case 0x636d7064: return self.completionDate // "cmpd"
        case 0x656e756d: return self.constant // "enum"
        case 0x636e7474: return self.contact // "cntt"
        case 0x7473706e: return self.contact // "tspn"
        case 0x6c776370: return self.copies // "lwcp"
        case 0x63726564: return self.creationDate // "cred"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x6c647420: return self.date // "ldt\0x20"
        case 0x64656320: return self.December // "dec\0x20"
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x6c776474: return self.detailed // "lwdt"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x64756564: return self.dueDate // "dued"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x6c776c70: return self.endingPage // "lwlp"
        case 0x45505320: return self.EPSPicture // "EPS\0x20"
        case 0x6c776568: return self.errorHandling // "lweh"
        case 0x65787061: return self.expansion // "expa"
        case 0x65787465: return self.extendedReal // "exte"
        case 0x6661786e: return self.faxNumber // "faxn"
        case 0x66656220: return self.February // "feb\0x20"
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x66737320: return self.fileSpecification // "fss\0x20"
        case 0x6675726c: return self.fileURL // "furl"
        case 0x66697864: return self.fixed // "fixd"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x66726920: return self.Friday // "fri\0x20"
        case 0x70697366: return self.frontmost // "pisf"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID\0x20\0x20"
        case 0x70696478: return self.index // "pidx"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x69647473: return self.itemDetails // "idts"
        case 0x6a616e20: return self.January // "jan\0x20"
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul\0x20"
        case 0x6a756e20: return self.June // "jun\0x20"
        case 0x6b706964: return self.kernelProcessID // "kpid"
        case 0x6b736874: return self.keyboardShortcut // "ksht"
        case 0x6c64626c: return self.largeReal // "ldbl"
        case 0x6c697374: return self.list // "list"
        case 0x74736c73: return self.list_ // "tsls"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar\0x20"
        case 0x6d617920: return self.May // "may\0x20"
        case 0x69736d6e: return self.minimizable // "ismn"
        case 0x706d6e64: return self.minimized // "pmnd"
        case 0x6d6f6464: return self.modificationDate // "modd"
        case 0x6d6f6e20: return self.Monday // "mon\0x20"
        case 0x706e616d: return self.name // "pnam"
        case 0x6e6f2020: return self.no // "no\0x20\0x20"
        case 0x6e6f7465: return self.notes // "note"
        case 0x6e6f7620: return self.November // "nov\0x20"
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct\0x20"
        case 0x7464696f: return self.open // "tdio"
        case 0x6c776c61: return self.pagesAcross // "lwla"
        case 0x6c776c64: return self.pagesDown // "lwld"
        case 0x70746167: return self.parentTag // "ptag"
        case 0x50494354: return self.PICTPicture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x51447074: return self.point // "QDpt"
        case 0x70736574: return self.printSettings // "pset"
        case 0x70736e20: return self.processSerialNumber // "psn\0x20"
        case 0x74737074: return self.project // "tspt"
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x646f7562: return self.real // "doub"
        case 0x7265636f: return self.record // "reco"
        case 0x6f626a20: return self.reference // "obj\0x20"
        case 0x7072737a: return self.resizable // "prsz"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x73617420: return self.Saturday // "sat\0x20"
        case 0x73637074: return self.script // "scpt"
        case 0x74736c74: return self.selectedToDo // "tslt"
        case 0x73657020: return self.September // "sep\0x20"
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x73696e67: return self.smallReal // "sing"
        case 0x6c777374: return self.standard // "lwst"
        case 0x6c776670: return self.startingPage // "lwfp"
        case 0x74647374: return self.status // "tdst"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x73756e20: return self.Sunday // "sun\0x20"
        case 0x74737467: return self.tag // "tstg"
        case 0x746e616d: return self.tagNames // "tnam"
        case 0x74727072: return self.targetPrinter // "trpr"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu\0x20"
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x7473746b: return self.toDo // "tstk"
        case 0x74756520: return self.Tuesday // "tue\0x20"
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.UnicodeText // "utxt"
        case 0x75636f6d: return self.unsignedDoubleInteger // "ucom"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75736872: return self.unsignedShortInteger // "ushr"
        case 0x75743136: return self.UTF16Text // "ut16"
        case 0x75746638: return self.UTF8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x70766973: return self.visible // "pvis"
        case 0x77656420: return self.Wednesday // "wed\0x20"
        case 0x77686974: return self.whitespace // "whit"
        case 0x6377696e: return self.window // "cwin"
        case 0x70736374: return self.writingCode // "psct"
        case 0x79657320: return self.yes // "yes\0x20"
        case 0x69737a6d: return self.zoomable // "iszm"
        case 0x707a756d: return self.zoomed // "pzum"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! THISymbol
        }
    }

    // Types/properties
    public static let activationDate = THISymbol(name: "activationDate", code: 0x61637464, type: typeType) // "actd"
    public static let alias = THISymbol(name: "alias", code: 0x616c6973, type: typeType) // "alis"
    public static let anything = THISymbol(name: "anything", code: 0x2a2a2a2a, type: typeType) // "****"
    public static let application = THISymbol(name: "application", code: 0x63617070, type: typeType) // "capp"
    public static let applicationBundleID = THISymbol(name: "applicationBundleID", code: 0x62756e64, type: typeType) // "bund"
    public static let applicationSignature = THISymbol(name: "applicationSignature", code: 0x7369676e, type: typeType) // "sign"
    public static let applicationURL = THISymbol(name: "applicationURL", code: 0x6170726c, type: typeType) // "aprl"
    public static let April = THISymbol(name: "April", code: 0x61707220, type: typeType) // "apr\0x20"
    public static let area = THISymbol(name: "area", code: 0x74736161, type: typeType) // "tsaa"
    public static let August = THISymbol(name: "August", code: 0x61756720, type: typeType) // "aug\0x20"
    public static let best = THISymbol(name: "best", code: 0x62657374, type: typeType) // "best"
    public static let bookmarkData = THISymbol(name: "bookmarkData", code: 0x626d726b, type: typeType) // "bmrk"
    public static let boolean = THISymbol(name: "boolean", code: 0x626f6f6c, type: typeType) // "bool"
    public static let boundingRectangle = THISymbol(name: "boundingRectangle", code: 0x71647274, type: typeType) // "qdrt"
    public static let bounds = THISymbol(name: "bounds", code: 0x70626e64, type: typeType) // "pbnd"
    public static let cancellationDate = THISymbol(name: "cancellationDate", code: 0x636e6364, type: typeType) // "cncd"
    public static let class_ = THISymbol(name: "class_", code: 0x70636c73, type: typeType) // "pcls"
    public static let closeable = THISymbol(name: "closeable", code: 0x68636c62, type: typeType) // "hclb"
    public static let collapsed = THISymbol(name: "collapsed", code: 0x636f6c70, type: typeType) // "colp"
    public static let collating = THISymbol(name: "collating", code: 0x6c77636c, type: typeType) // "lwcl"
    public static let colorTable = THISymbol(name: "colorTable", code: 0x636c7274, type: typeType) // "clrt"
    public static let completionDate = THISymbol(name: "completionDate", code: 0x636d7064, type: typeType) // "cmpd"
    public static let constant = THISymbol(name: "constant", code: 0x656e756d, type: typeType) // "enum"
    public static let contact = THISymbol(name: "contact", code: 0x7473706e, type: typeType) // "tspn"
    public static let copies = THISymbol(name: "copies", code: 0x6c776370, type: typeType) // "lwcp"
    public static let creationDate = THISymbol(name: "creationDate", code: 0x63726564, type: typeType) // "cred"
    public static let dashStyle = THISymbol(name: "dashStyle", code: 0x74646173, type: typeType) // "tdas"
    public static let data = THISymbol(name: "data", code: 0x74647461, type: typeType) // "tdta"
    public static let date = THISymbol(name: "date", code: 0x6c647420, type: typeType) // "ldt\0x20"
    public static let December = THISymbol(name: "December", code: 0x64656320, type: typeType) // "dec\0x20"
    public static let decimalStruct = THISymbol(name: "decimalStruct", code: 0x6465636d, type: typeType) // "decm"
    public static let doubleInteger = THISymbol(name: "doubleInteger", code: 0x636f6d70, type: typeType) // "comp"
    public static let dueDate = THISymbol(name: "dueDate", code: 0x64756564, type: typeType) // "dued"
    public static let encodedString = THISymbol(name: "encodedString", code: 0x656e6373, type: typeType) // "encs"
    public static let endingPage = THISymbol(name: "endingPage", code: 0x6c776c70, type: typeType) // "lwlp"
    public static let EPSPicture = THISymbol(name: "EPSPicture", code: 0x45505320, type: typeType) // "EPS\0x20"
    public static let errorHandling = THISymbol(name: "errorHandling", code: 0x6c776568, type: typeType) // "lweh"
    public static let extendedReal = THISymbol(name: "extendedReal", code: 0x65787465, type: typeType) // "exte"
    public static let faxNumber = THISymbol(name: "faxNumber", code: 0x6661786e, type: typeType) // "faxn"
    public static let February = THISymbol(name: "February", code: 0x66656220, type: typeType) // "feb\0x20"
    public static let fileRef = THISymbol(name: "fileRef", code: 0x66737266, type: typeType) // "fsrf"
    public static let fileSpecification = THISymbol(name: "fileSpecification", code: 0x66737320, type: typeType) // "fss\0x20"
    public static let fileURL = THISymbol(name: "fileURL", code: 0x6675726c, type: typeType) // "furl"
    public static let fixed = THISymbol(name: "fixed", code: 0x66697864, type: typeType) // "fixd"
    public static let fixedPoint = THISymbol(name: "fixedPoint", code: 0x66706e74, type: typeType) // "fpnt"
    public static let fixedRectangle = THISymbol(name: "fixedRectangle", code: 0x66726374, type: typeType) // "frct"
    public static let Friday = THISymbol(name: "Friday", code: 0x66726920, type: typeType) // "fri\0x20"
    public static let frontmost = THISymbol(name: "frontmost", code: 0x70697366, type: typeType) // "pisf"
    public static let GIFPicture = THISymbol(name: "GIFPicture", code: 0x47494666, type: typeType) // "GIFf"
    public static let graphicText = THISymbol(name: "graphicText", code: 0x63677478, type: typeType) // "cgtx"
    public static let id = THISymbol(name: "id", code: 0x49442020, type: typeType) // "ID\0x20\0x20"
    public static let index = THISymbol(name: "index", code: 0x70696478, type: typeType) // "pidx"
    public static let integer = THISymbol(name: "integer", code: 0x6c6f6e67, type: typeType) // "long"
    public static let internationalText = THISymbol(name: "internationalText", code: 0x69747874, type: typeType) // "itxt"
    public static let internationalWritingCode = THISymbol(name: "internationalWritingCode", code: 0x696e746c, type: typeType) // "intl"
    public static let item = THISymbol(name: "item", code: 0x636f626a, type: typeType) // "cobj"
    public static let itemDetails = THISymbol(name: "itemDetails", code: 0x69647473, type: typeType) // "idts"
    public static let January = THISymbol(name: "January", code: 0x6a616e20, type: typeType) // "jan\0x20"
    public static let JPEGPicture = THISymbol(name: "JPEGPicture", code: 0x4a504547, type: typeType) // "JPEG"
    public static let July = THISymbol(name: "July", code: 0x6a756c20, type: typeType) // "jul\0x20"
    public static let June = THISymbol(name: "June", code: 0x6a756e20, type: typeType) // "jun\0x20"
    public static let kernelProcessID = THISymbol(name: "kernelProcessID", code: 0x6b706964, type: typeType) // "kpid"
    public static let keyboardShortcut = THISymbol(name: "keyboardShortcut", code: 0x6b736874, type: typeType) // "ksht"
    public static let largeReal = THISymbol(name: "largeReal", code: 0x6c64626c, type: typeType) // "ldbl"
    public static let list = THISymbol(name: "list", code: 0x6c697374, type: typeType) // "list"
    public static let list_ = THISymbol(name: "list_", code: 0x74736c73, type: typeType) // "tsls"
    public static let locationReference = THISymbol(name: "locationReference", code: 0x696e736c, type: typeType) // "insl"
    public static let longFixed = THISymbol(name: "longFixed", code: 0x6c667864, type: typeType) // "lfxd"
    public static let longFixedPoint = THISymbol(name: "longFixedPoint", code: 0x6c667074, type: typeType) // "lfpt"
    public static let longFixedRectangle = THISymbol(name: "longFixedRectangle", code: 0x6c667263, type: typeType) // "lfrc"
    public static let longPoint = THISymbol(name: "longPoint", code: 0x6c706e74, type: typeType) // "lpnt"
    public static let longRectangle = THISymbol(name: "longRectangle", code: 0x6c726374, type: typeType) // "lrct"
    public static let machine = THISymbol(name: "machine", code: 0x6d616368, type: typeType) // "mach"
    public static let machineLocation = THISymbol(name: "machineLocation", code: 0x6d4c6f63, type: typeType) // "mLoc"
    public static let machPort = THISymbol(name: "machPort", code: 0x706f7274, type: typeType) // "port"
    public static let March = THISymbol(name: "March", code: 0x6d617220, type: typeType) // "mar\0x20"
    public static let May = THISymbol(name: "May", code: 0x6d617920, type: typeType) // "may\0x20"
    public static let minimizable = THISymbol(name: "minimizable", code: 0x69736d6e, type: typeType) // "ismn"
    public static let minimized = THISymbol(name: "minimized", code: 0x706d6e64, type: typeType) // "pmnd"
    public static let modificationDate = THISymbol(name: "modificationDate", code: 0x6d6f6464, type: typeType) // "modd"
    public static let Monday = THISymbol(name: "Monday", code: 0x6d6f6e20, type: typeType) // "mon\0x20"
    public static let name = THISymbol(name: "name", code: 0x706e616d, type: typeType) // "pnam"
    public static let notes = THISymbol(name: "notes", code: 0x6e6f7465, type: typeType) // "note"
    public static let November = THISymbol(name: "November", code: 0x6e6f7620, type: typeType) // "nov\0x20"
    public static let null = THISymbol(name: "null", code: 0x6e756c6c, type: typeType) // "null"
    public static let October = THISymbol(name: "October", code: 0x6f637420, type: typeType) // "oct\0x20"
    public static let pagesAcross = THISymbol(name: "pagesAcross", code: 0x6c776c61, type: typeType) // "lwla"
    public static let pagesDown = THISymbol(name: "pagesDown", code: 0x6c776c64, type: typeType) // "lwld"
    public static let parentTag = THISymbol(name: "parentTag", code: 0x70746167, type: typeType) // "ptag"
    public static let PICTPicture = THISymbol(name: "PICTPicture", code: 0x50494354, type: typeType) // "PICT"
    public static let pixelMapRecord = THISymbol(name: "pixelMapRecord", code: 0x74706d6d, type: typeType) // "tpmm"
    public static let point = THISymbol(name: "point", code: 0x51447074, type: typeType) // "QDpt"
    public static let printSettings = THISymbol(name: "printSettings", code: 0x70736574, type: typeType) // "pset"
    public static let processSerialNumber = THISymbol(name: "processSerialNumber", code: 0x70736e20, type: typeType) // "psn\0x20"
    public static let project = THISymbol(name: "project", code: 0x74737074, type: typeType) // "tspt"
    public static let properties = THISymbol(name: "properties", code: 0x70414c4c, type: typeType) // "pALL"
    public static let property_ = THISymbol(name: "property_", code: 0x70726f70, type: typeType) // "prop"
    public static let real = THISymbol(name: "real", code: 0x646f7562, type: typeType) // "doub"
    public static let record = THISymbol(name: "record", code: 0x7265636f, type: typeType) // "reco"
    public static let reference = THISymbol(name: "reference", code: 0x6f626a20, type: typeType) // "obj\0x20"
    public static let resizable = THISymbol(name: "resizable", code: 0x7072737a, type: typeType) // "prsz"
    public static let RGB16Color = THISymbol(name: "RGB16Color", code: 0x74723136, type: typeType) // "tr16"
    public static let RGB96Color = THISymbol(name: "RGB96Color", code: 0x74723936, type: typeType) // "tr96"
    public static let RGBColor = THISymbol(name: "RGBColor", code: 0x63524742, type: typeType) // "cRGB"
    public static let rotation = THISymbol(name: "rotation", code: 0x74726f74, type: typeType) // "trot"
    public static let Saturday = THISymbol(name: "Saturday", code: 0x73617420, type: typeType) // "sat\0x20"
    public static let script = THISymbol(name: "script", code: 0x73637074, type: typeType) // "scpt"
    public static let selectedToDo = THISymbol(name: "selectedToDo", code: 0x74736c74, type: typeType) // "tslt"
    public static let September = THISymbol(name: "September", code: 0x73657020, type: typeType) // "sep\0x20"
    public static let shortInteger = THISymbol(name: "shortInteger", code: 0x73686f72, type: typeType) // "shor"
    public static let smallReal = THISymbol(name: "smallReal", code: 0x73696e67, type: typeType) // "sing"
    public static let startingPage = THISymbol(name: "startingPage", code: 0x6c776670, type: typeType) // "lwfp"
    public static let status = THISymbol(name: "status", code: 0x74647374, type: typeType) // "tdst"
    public static let string = THISymbol(name: "string", code: 0x54455854, type: typeType) // "TEXT"
    public static let styledClipboardText = THISymbol(name: "styledClipboardText", code: 0x7374796c, type: typeType) // "styl"
    public static let styledText = THISymbol(name: "styledText", code: 0x53545854, type: typeType) // "STXT"
    public static let Sunday = THISymbol(name: "Sunday", code: 0x73756e20, type: typeType) // "sun\0x20"
    public static let tag = THISymbol(name: "tag", code: 0x74737467, type: typeType) // "tstg"
    public static let tagNames = THISymbol(name: "tagNames", code: 0x746e616d, type: typeType) // "tnam"
    public static let targetPrinter = THISymbol(name: "targetPrinter", code: 0x74727072, type: typeType) // "trpr"
    public static let textStyleInfo = THISymbol(name: "textStyleInfo", code: 0x74737479, type: typeType) // "tsty"
    public static let Thursday = THISymbol(name: "Thursday", code: 0x74687520, type: typeType) // "thu\0x20"
    public static let TIFFPicture = THISymbol(name: "TIFFPicture", code: 0x54494646, type: typeType) // "TIFF"
    public static let toDo = THISymbol(name: "toDo", code: 0x7473746b, type: typeType) // "tstk"
    public static let Tuesday = THISymbol(name: "Tuesday", code: 0x74756520, type: typeType) // "tue\0x20"
    public static let typeClass = THISymbol(name: "typeClass", code: 0x74797065, type: typeType) // "type"
    public static let UnicodeText = THISymbol(name: "UnicodeText", code: 0x75747874, type: typeType) // "utxt"
    public static let unsignedDoubleInteger = THISymbol(name: "unsignedDoubleInteger", code: 0x75636f6d, type: typeType) // "ucom"
    public static let unsignedInteger = THISymbol(name: "unsignedInteger", code: 0x6d61676e, type: typeType) // "magn"
    public static let unsignedShortInteger = THISymbol(name: "unsignedShortInteger", code: 0x75736872, type: typeType) // "ushr"
    public static let UTF16Text = THISymbol(name: "UTF16Text", code: 0x75743136, type: typeType) // "ut16"
    public static let UTF8Text = THISymbol(name: "UTF8Text", code: 0x75746638, type: typeType) // "utf8"
    public static let version = THISymbol(name: "version", code: 0x76657273, type: typeType) // "vers"
    public static let visible = THISymbol(name: "visible", code: 0x70766973, type: typeType) // "pvis"
    public static let Wednesday = THISymbol(name: "Wednesday", code: 0x77656420, type: typeType) // "wed\0x20"
    public static let window = THISymbol(name: "window", code: 0x6377696e, type: typeType) // "cwin"
    public static let writingCode = THISymbol(name: "writingCode", code: 0x70736374, type: typeType) // "psct"
    public static let zoomable = THISymbol(name: "zoomable", code: 0x69737a6d, type: typeType) // "iszm"
    public static let zoomed = THISymbol(name: "zoomed", code: 0x707a756d, type: typeType) // "pzum"

    // Enumerators
    public static let ask = THISymbol(name: "ask", code: 0x61736b20, type: typeEnumerated) // "ask\0x20"
    public static let canceled = THISymbol(name: "canceled", code: 0x7464636c, type: typeEnumerated) // "tdcl"
    public static let case_ = THISymbol(name: "case_", code: 0x63617365, type: typeEnumerated) // "case"
    public static let completed = THISymbol(name: "completed", code: 0x7464636d, type: typeEnumerated) // "tdcm"
    public static let detailed = THISymbol(name: "detailed", code: 0x6c776474, type: typeEnumerated) // "lwdt"
    public static let diacriticals = THISymbol(name: "diacriticals", code: 0x64696163, type: typeEnumerated) // "diac"
    public static let expansion = THISymbol(name: "expansion", code: 0x65787061, type: typeEnumerated) // "expa"
    public static let hyphens = THISymbol(name: "hyphens", code: 0x68797068, type: typeEnumerated) // "hyph"
    public static let no = THISymbol(name: "no", code: 0x6e6f2020, type: typeEnumerated) // "no\0x20\0x20"
    public static let numericStrings = THISymbol(name: "numericStrings", code: 0x6e756d65, type: typeEnumerated) // "nume"
    public static let open = THISymbol(name: "open", code: 0x7464696f, type: typeEnumerated) // "tdio"
    public static let punctuation = THISymbol(name: "punctuation", code: 0x70756e63, type: typeEnumerated) // "punc"
    public static let standard = THISymbol(name: "standard", code: 0x6c777374, type: typeEnumerated) // "lwst"
    public static let whitespace = THISymbol(name: "whitespace", code: 0x77686974, type: typeEnumerated) // "whit"
    public static let yes = THISymbol(name: "yes", code: 0x79657320, type: typeEnumerated) // "yes\0x20"
}

public typealias THI = THISymbol // allows symbols to be written as (e.g.) THI.name instead of THISymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on Things3.app terminology

public protocol THICommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension THICommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func addContactNamed(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "addContactNamed", eventClass: 0x54484753, eventID: 0x61636162, // "THGS"/"acab"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func addContactNamed<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "addContactNamed", eventClass: 0x54484753, eventID: 0x61636162, // "THGS"/"acab"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func close(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "close", eventClass: 0x636f7265, eventID: 0x636c6f73, // "core"/"clos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func close<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "close", eventClass: 0x636f7265, eventID: 0x636c6f73, // "core"/"clos"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func count(_ directParameter: Any = SwiftAutomation.NoParameter,
            each: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "count", eventClass: 0x636f7265, eventID: 0x636e7465, // "core"/"cnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func count<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            each: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "count", eventClass: 0x636f7265, eventID: 0x636e7465, // "core"/"cnte"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("each", 0x6b6f636c, each), // "kocl"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func delete(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "delete", eventClass: 0x636f7265, eventID: 0x64656c6f, // "core"/"delo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func delete<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "delete", eventClass: 0x636f7265, eventID: 0x64656c6f, // "core"/"delo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func duplicate(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "duplicate", eventClass: 0x636f7265, eventID: 0x636c6f6e, // "core"/"clon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func duplicate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "duplicate", eventClass: 0x636f7265, eventID: 0x636c6f6e, // "core"/"clon"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x696e7368, to), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func edit(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "edit", eventClass: 0x54484753, eventID: 0x65647474, // "THGS"/"edtt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func edit<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "edit", eventClass: 0x54484753, eventID: 0x65647474, // "THGS"/"edtt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func emptyTrash(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "emptyTrash", eventClass: 0x54484753, eventID: 0x656d7074, // "THGS"/"empt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func emptyTrash<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "emptyTrash", eventClass: 0x54484753, eventID: 0x656d7074, // "THGS"/"empt"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func exists(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "exists", eventClass: 0x636f7265, eventID: 0x646f6578, // "core"/"doex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func exists<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "exists", eventClass: 0x636f7265, eventID: 0x646f6578, // "core"/"doex"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func logCompletedNow(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "logCompletedNow", eventClass: 0x54484753, eventID: 0x6c6f6763, // "THGS"/"logc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func logCompletedNow<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "logCompletedNow", eventClass: 0x54484753, eventID: 0x6c6f6763, // "THGS"/"logc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func make(_ directParameter: Any = SwiftAutomation.NoParameter,
            new: Any = SwiftAutomation.NoParameter,
            at: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "make", eventClass: 0x636f7265, eventID: 0x6372656c, // "core"/"crel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func make<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            new: Any = SwiftAutomation.NoParameter,
            at: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "make", eventClass: 0x636f7265, eventID: 0x6372656c, // "core"/"crel"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("new", 0x6b6f636c, new), // "kocl"
                    ("at", 0x696e7368, at), // "insh"
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func move(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "move", eventClass: 0x54484753, eventID: 0x6d76746c, // "THGS"/"mvtl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x6d766c73, to), // "mvls"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func move<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "move", eventClass: 0x54484753, eventID: 0x6d76746c, // "THGS"/"mvtl"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x6d766c73, to), // "mvls"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func parseQuicksilverInput(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "parseQuicksilverInput", eventClass: 0x54484753, eventID: 0x61647471, // "THGS"/"adtq"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func parseQuicksilverInput<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "parseQuicksilverInput", eventClass: 0x54484753, eventID: 0x61647471, // "THGS"/"adtq"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            printDialog: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            printDialog: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("withProperties", 0x70726474, withProperties), // "prdt"
                    ("printDialog", 0x70646c67, printDialog), // "pdlg"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func schedule(_ directParameter: Any = SwiftAutomation.NoParameter,
            for_: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "schedule", eventClass: 0x54484753, eventID: 0x73636864, // "THGS"/"schd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("for_", 0x73646174, for_), // "sdat"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func schedule<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            for_: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "schedule", eventClass: 0x54484753, eventID: 0x73636864, // "THGS"/"schd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("for_", 0x73646174, for_), // "sdat"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func show(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "show", eventClass: 0x54484753, eventID: 0x73686f77, // "THGS"/"show"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func show<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "show", eventClass: 0x54484753, eventID: 0x73686f77, // "THGS"/"show"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func showQuickEntryPanel(_ directParameter: Any = SwiftAutomation.NoParameter,
            withAutofill: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "showQuickEntryPanel", eventClass: 0x54484753, eventID: 0x73716570, // "THGS"/"sqep"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("withAutofill", 0x71656166, withAutofill), // "qeaf"
                    ("withProperties", 0x71657070, withProperties), // "qepp"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func showQuickEntryPanel<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            withAutofill: Any = SwiftAutomation.NoParameter,
            withProperties: Any = SwiftAutomation.NoParameter,
            requestedType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "showQuickEntryPanel", eventClass: 0x54484753, eventID: 0x73716570, // "THGS"/"sqep"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("withAutofill", 0x71656166, withAutofill), // "qeaf"
                    ("withProperties", 0x71657070, withProperties), // "qepp"
                ], requestedType: requestedType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol THIObject: SwiftAutomation.ObjectSpecifierExtension, THICommand {} // provides vars and methods for constructing specifiers

extension THIObject {
    
    // Properties
    public var activationDate: THIItem {return self.property(0x61637464) as! THIItem} // "actd"
    public var area: THIItem {return self.property(0x74736161) as! THIItem} // "tsaa"
    public var bounds: THIItem {return self.property(0x70626e64) as! THIItem} // "pbnd"
    public var cancellationDate: THIItem {return self.property(0x636e6364) as! THIItem} // "cncd"
    public var class_: THIItem {return self.property(0x70636c73) as! THIItem} // "pcls"
    public var closeable: THIItem {return self.property(0x68636c62) as! THIItem} // "hclb"
    public var collapsed: THIItem {return self.property(0x636f6c70) as! THIItem} // "colp"
    public var collating: THIItem {return self.property(0x6c77636c) as! THIItem} // "lwcl"
    public var completionDate: THIItem {return self.property(0x636d7064) as! THIItem} // "cmpd"
    public var contact: THIItem {return self.property(0x636e7474) as! THIItem} // "cntt"
    public var copies: THIItem {return self.property(0x6c776370) as! THIItem} // "lwcp"
    public var creationDate: THIItem {return self.property(0x63726564) as! THIItem} // "cred"
    public var dueDate: THIItem {return self.property(0x64756564) as! THIItem} // "dued"
    public var endingPage: THIItem {return self.property(0x6c776c70) as! THIItem} // "lwlp"
    public var errorHandling: THIItem {return self.property(0x6c776568) as! THIItem} // "lweh"
    public var faxNumber: THIItem {return self.property(0x6661786e) as! THIItem} // "faxn"
    public var frontmost: THIItem {return self.property(0x70697366) as! THIItem} // "pisf"
    public var id: THIItem {return self.property(0x49442020) as! THIItem} // "ID\0x20\0x20"
    public var index: THIItem {return self.property(0x70696478) as! THIItem} // "pidx"
    public var keyboardShortcut: THIItem {return self.property(0x6b736874) as! THIItem} // "ksht"
    public var minimizable: THIItem {return self.property(0x69736d6e) as! THIItem} // "ismn"
    public var minimized: THIItem {return self.property(0x706d6e64) as! THIItem} // "pmnd"
    public var modificationDate: THIItem {return self.property(0x6d6f6464) as! THIItem} // "modd"
    public var name: THIItem {return self.property(0x706e616d) as! THIItem} // "pnam"
    public var notes: THIItem {return self.property(0x6e6f7465) as! THIItem} // "note"
    public var pagesAcross: THIItem {return self.property(0x6c776c61) as! THIItem} // "lwla"
    public var pagesDown: THIItem {return self.property(0x6c776c64) as! THIItem} // "lwld"
    public var parentTag: THIItem {return self.property(0x70746167) as! THIItem} // "ptag"
    public var project: THIItem {return self.property(0x74737074) as! THIItem} // "tspt"
    public var properties: THIItem {return self.property(0x70414c4c) as! THIItem} // "pALL"
    public var resizable: THIItem {return self.property(0x7072737a) as! THIItem} // "prsz"
    public var startingPage: THIItem {return self.property(0x6c776670) as! THIItem} // "lwfp"
    public var status: THIItem {return self.property(0x74647374) as! THIItem} // "tdst"
    public var tagNames: THIItem {return self.property(0x746e616d) as! THIItem} // "tnam"
    public var targetPrinter: THIItem {return self.property(0x74727072) as! THIItem} // "trpr"
    public var version: THIItem {return self.property(0x76657273) as! THIItem} // "vers"
    public var visible: THIItem {return self.property(0x70766973) as! THIItem} // "pvis"
    public var zoomable: THIItem {return self.property(0x69737a6d) as! THIItem} // "iszm"
    public var zoomed: THIItem {return self.property(0x707a756d) as! THIItem} // "pzum"

    // Elements
    public var applications: THIItems {return self.elements(0x63617070) as! THIItems} // "capp"
    public var areas: THIItems {return self.elements(0x74736161) as! THIItems} // "tsaa"
    public var contacts: THIItems {return self.elements(0x7473706e) as! THIItems} // "tspn"
    public var items: THIItems {return self.elements(0x636f626a) as! THIItems} // "cobj"
    public var lists: THIItems {return self.elements(0x74736c73) as! THIItems} // "tsls"
    public var projects: THIItems {return self.elements(0x74737074) as! THIItems} // "tspt"
    public var selectedToDos: THIItems {return self.elements(0x74736c74) as! THIItems} // "tslt"
    public var tags: THIItems {return self.elements(0x74737467) as! THIItems} // "tstg"
    public var toDos: THIItems {return self.elements(0x7473746b) as! THIItems} // "tstk"
    public var windows: THIItems {return self.elements(0x6377696e) as! THIItems} // "cwin"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class THIInsertion: SwiftAutomation.InsertionSpecifier, THICommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class THIItem: SwiftAutomation.ObjectSpecifier, THIObject {
    public typealias InsertionSpecifierType = THIInsertion
    public typealias ObjectSpecifierType = THIItem
    public typealias MultipleObjectSpecifierType = THIItems
}

// by-range/by-test/all
public class THIItems: THIItem, SwiftAutomation.MultipleObjectSpecifierExtension {}

// App/Con/Its
public class THIRoot: SwiftAutomation.RootSpecifier, THIObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = THIInsertion
    public typealias ObjectSpecifierType = THIItem
    public typealias MultipleObjectSpecifierType = THIItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class Things3: THIRoot, SwiftAutomation.Application {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.DefaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.DefaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.AppRootDesc, appData: Swift.type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.culturedcode.ThingsMac", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let THIApp = _untargetedAppData.app as! THIRoot
public let THICon = _untargetedAppData.con as! THIRoot
public let THIIts = _untargetedAppData.its as! THIRoot


/******************************************************************************/
// Static types

public typealias THIRecord = [THISymbol:Any] // default Swift type for AERecordDescs







