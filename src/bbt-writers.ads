-- -----------------------------------------------------------------------------
-- bbt, the black box tester (https://github.com/LionelDraghi/bbt)
-- Author : Lionel Draghi
-- SPDX-License-Identifier: APSL-2.0
-- SPDX-FileCopyrightText: 2025, Lionel Draghi
-- -----------------------------------------------------------------------------

with BBT.Documents; use BBT.Documents;
with BBT.IO;
with BBT.Tests.Results;

private package BBT.Writers is
-- This package defines common services for all types of output, and
-- the abstract interface that each new writer (defined in child
-- packages) should implement.

   -- --------------------------------------------------------------------------
   type Output_Format is (Markdown, Badge, Txt, AsciiDoc, Terminal);
   -- WARNING : When calling Enable, there should be a registered Writer,
   --           otherwise an access check exception will be raised at run time.
   --           (cf. the child procedure Initialize)

   -- -------------------------------------------------------------------------
   function Is_Enabled (F : Output_Format) return Boolean;
   function No_Output_Format_Enabled return Boolean;

   function File_Pattern (For_Format : Output_Format) return String;
   -- Returns the regexp that will be used to identify sources files
   -- of this format.

   function Default_Extension (For_Format : Output_Format) return String;
   -- Preferred extension when creating a file of this format

   procedure File_Format (File_Name    :     String;
                          Found        : out Boolean;
                          Found_Format : out Output_Format);

   procedure Enable_Output (For_Format : Output_Format;
                            File_Name  : String := "");
   -- Will find and initialize the writer for this format.

   -- -------------------------------------------------------------------------
   -- Runner Events
   -- During test run, each event result in a call on those procedure, that
   -- will be dispatch on each enabled Formatter
   procedure Put_Summary;
   procedure Put_Step_Result (Step     : BBT.Documents.Step_Type;
                              Success  : Boolean;
                              Fail_Msg : String;
                              Loc      : BBT.IO.Location_Type);
   procedure Put_Overall_Results (Results : BBT.Tests.Results.Test_Results_Count);

   -- -------------------------------------------------------------------------
   -- Output of the scenario as understood and stored by bbt
   procedure Put_Document_List (Doc_List : Documents.Documents_Lists.Vector);

private
   -- -------------------------------------------------------------------------
   type Abstract_Writer is abstract tagged limited null record;

   function Default_Extension
     (Writer : Abstract_Writer) return String is abstract;
   -- Preferred extension when creating a file of this format

   function File_Pattern
     (Writer : Abstract_Writer) return String is abstract;
   -- Regexp of files of this format

   function Is_Of_The_Format (Writer    : Abstract_Writer;
                              File_Name : String) return Boolean is abstract;
   -- Returns True if the given file is processed by this writer.

   procedure Enable_Output (Writer    : Abstract_Writer;
                            File_Name : String := "") is abstract;
   -- Enable the Writer

   -- -------------------------------------------------------------------------
   procedure Put_Summary (Writer : Abstract_Writer) is abstract;
   procedure Put_Step_Result (Writer    : Abstract_Writer;
                              Step      : BBT.Documents.Step_Type;
                              Success   : Boolean;
                              Fail_Msg  : String;
                              Loc       : BBT.IO.Location_Type) is abstract;
   procedure Put_Overall_Results
     (Writer    : Abstract_Writer;
      Results   : BBT.Tests.Results.Test_Results_Count) is abstract;

   -- -------------------------------------------------------------------------
   -- Output of the scenario as understood and stored by bbt
   procedure Put_Step (Writer : Abstract_Writer;
                       Step   : Step_Type) is abstract;
   procedure Put_Scenario_Title (Writer : Abstract_Writer;
                                 S      : String) is abstract;
   procedure Put_Feature_Title (Writer : Abstract_Writer;
                                S      : String) is abstract;
   procedure Put_Document_Title (Writer : Abstract_Writer;
                                 S      : String) is abstract;

   -- -------------------------------------------------------------------------
   type Interface_Access is access all Abstract_Writer'Class;
   procedure Register (Writer     : Interface_Access;
                       For_Format : Output_Format);

end BBT.Writers;
