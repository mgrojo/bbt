-- -----------------------------------------------------------------------------
-- bbt, the black box tester (https://github.com/LionelDraghi/bbt)
-- Author: Lionel Draghi
-- SPDX-License-Identifier: APSL-2.0
-- SPDX-FileCopyrightText: 2025, Lionel Draghi
-- -----------------------------------------------------------------------------

with BBT.IO,
     BBT.Settings,
     BBT.Tests.Results;

use BBT,
    BBT.IO,
    BBT.Settings;

with File_Utilities;

with Ada.Directories;

with GNAT.Regexp;

package body BBT.Writers.Markdown_Writers is

   -- -----------------------------------------------------------------------
   procedure Put_Debug_Line
     (Item      : String;
      Location  : Location_Type := No_Location;
      Verbosity : Verbosity_Levels := Debug;
      Topic     : Extended_Topics := IO.MD_Writer) renames BBT.IO.Put_Line;
   pragma Warnings (Off, Put_Debug_Line);

   -- --------------------------------------------------------------------------
   Processor       : aliased Markdown_Writer;
   Regexp          : constant String := ("*.md");
   Compiled_Regexp : constant GNAT.Regexp.Regexp :=
     GNAT.Regexp.Compile
       (Pattern => Regexp, Glob => True, Case_Sensitive => False);

   -- --------------------------------------------------------------------------
   procedure Initialize is
   begin
      Register (Writer => Processor'Access, For_Format => Markdown);
   end Initialize;

   -- --------------------------------------------------------------------------
   overriding
   function File_Pattern (Writer : Markdown_Writer) return String
   is (Regexp);

   -- --------------------------------------------------------------------------
   overriding
   procedure Enable_Output (Writer : Markdown_Writer; File_Name : String := "")
   is
   begin
      null;
   end Enable_Output;

   -- --------------------------------------------------------------------------
   overriding
   function Is_Of_The_Format
     (Writer : Markdown_Writer; File_Name : String) return Boolean is
   begin
      return GNAT.Regexp.Match (S => File_Name, R => Compiled_Regexp);
   end Is_Of_The_Format;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Summary (Writer : Markdown_Writer) is
      use all type Tests.Results.Test_Result;
   begin
      New_Line (Verbosity => Quiet);
      if Tests.Results.Success then
         Put_Line
           ("## Summary : **Success**,"
            & Count (Successful)'Image
            & " scenarios OK"
            & (if Count (Empty) = 0
              then ""
              else "," & Count (Empty)'Image & " empty scenarios"),
            Verbosity => Quiet);
      else
         Put_Line ("## Summary : **Fail**", Verbosity => Quiet);
      end if;
   end Put_Summary;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Detailed_Results (Writer : Markdown_Writer) is
      use Tests.Results;
      Verbosity_Level : constant Verbosity_Levels :=
        (if Success then Verbose else Quiet);
   begin
      New_Line (Verbosity => Verbosity_Level);
      Put_Line ("| Status     | Count |", Verbosity => Verbosity_Level);
      Put_Line ("|------------|-------|", Verbosity => Verbosity_Level);
      Put_Line
        ("| Failed     |" & Count_String_Image (Failed) & "|",
         Verbosity => Verbosity_Level);
      Put_Line
        ("| Successful |" & Count_String_Image (Successful) & "|",
         Verbosity => Verbosity_Level);
      Put_Line
        ("| Empty      |" & Count_String_Image (Empty) & "|",
         Verbosity => Verbosity_Level);
      --  if Count (Not_Run) /= 0 then
      Put_Line
        ("| Not Run    |" & Count_String_Image (Not_Run) & "|",
         Verbosity => Verbosity_Level);
      --  end if;
      New_Line (Verbosity => Verbosity_Level);
   end Put_Detailed_Results;

   -- --------------------------------------------------------------------------
   type Indent_Level is (Feature, Scenario);
   -- There is no Document level, because it's zero

   function Indent (Level : Indent_Level) return String is
      (case Level is
         when Feature  => "  ",
         when Scenario => "   ");
   -- Note that spacing over 4 should be avoided in Markdown,
   -- because it's considered as code block.

   function Prefix (Res : Boolean) return String
   is (Indent (Scenario) & (if Res then "- OK : " else "- **NOK** : "));

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Document_Start
     (Writer : Markdown_Writer; Doc : Document_Type'Class)
   is
      Path_To_Scen : constant String :=
        File_Utilities.Short_Path
          (From_Dir => Settings.Index_Dir, To_File => (+Doc.Name));
      Verbosity    : constant Verbosity_Levels := Normal;
   begin
      New_Line (Verbosity);
      Put_Line
        ("# Document: ["
         & Ada.Directories.Simple_Name (Path_To_Scen)
         & "]("
         & (Path_To_Scen)
         & ")  ",
         Verbosity => Verbosity);
   end Put_Document_Start;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Feature_Start
     (Writer : Markdown_Writer; Feat : Feature_Type'Class) is
   begin
      IO.Put_Line (Indent (Feature) & "## Feature: " & (+Feat.Name) & "  ");
   end Put_Feature_Start;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Scenario_Start
     (Writer    : Markdown_Writer;
      Scen      : Scenario_Type'Class;
      Verbosity : Verbosity_Levels)
   is
      Path_To_Scen : constant String :=
        File_Utilities.Short_Path
          (From_Dir => Settings.Index_Dir,
           To_File  => (+Parent_Doc (Scen).Name));
      -- Fixme: Path_To_Scen should be in Scenario_Type to avoid
      -- recomputing when looping on the writers
      Link_Image   : constant String :=
        ("[" & (+Scen.Name) & "](" & Path_To_Scen & ")");
      Scen_Kind : constant String := Indent (Scenario) &
        (if Scen.Is_Background
         then "### Background: "
         else "### Scenario: ");
   begin
      IO.Put_Line (Scen_Kind & Link_Image & ": ", Verbosity => Verbosity);
   end Put_Scenario_Start;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Step_Result
     (Writer   : Markdown_Writer;
      Step     : Step_Type'Class;
      Success  : Boolean;
      Fail_Msg : String;
      Loc       : BBT.IO.Location_Type;
      Verbosity : Verbosity_Levels)
   is
      Pre : constant String := Prefix (Success);
   begin
      Put_Debug_Line ("Put_Step_Result = " & Step'Image);
      Put_Debug_Line ("Step.Parent     = " & Step.Parent'Image);

      if Success then
         IO.Put_Line
           (Item      => Pre & (+Step.Data.Src_Code) & "  ",
            Verbosity => Verbosity);
      else
         IO.Put_Line
           (Pre & (+Step.Data.Src_Code) & " (" & IO.Image (Loc) & ")  ",
            Verbosity => Verbosity);
         IO.Put_Error (Fail_Msg & "  ", Loc);
      end if;
   end Put_Step_Result;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Scenario_Result
     (Writer    : Markdown_Writer;
      Scen      : Scenario_Type'Class;
      Verbosity : Verbosity_Levels)
   is
      Path_To_Scen : constant String :=
        File_Utilities.Short_Path
          (From_Dir => Settings.Index_Dir,
           To_File  => (+Parent_Doc (Scen).Name));
      -- Fixme: Path_To_Scen should be in Scenario_Type to avoid recomputing
      -- when looping on the writers
      Link_Image   : constant String :=
        ("[" & (+Scen.Name) & "](" & Path_To_Scen & ")");
      use Tests.Results;
      Scen_Kind    : constant String :=
        (if Scen.Is_Background then " background " else " scenario   ");
      Spaces : constant String := Indent (Scenario);

   begin
      case Tests.Results.Result (Scen) is
         when Empty =>
            -- Note the two spaces at the end of each line, to cause a
            -- new line in Markdown format when this line is followed
            -- by an error message.
            Put_Line
              (Spaces & "- [ ]"
               & Scen_Kind
               & Link_Image
               & " is empty, nothing tested  ",
               Verbosity => Verbosity);

         when Successful =>
            Put_Line
              (Spaces & "- [X]" & Scen_Kind & Link_Image & " pass  ",
               Verbosity => Verbosity);

         when Failed =>
            Put_Line
              (Spaces & "- [ ]" & Scen_Kind & Link_Image & " **fails**  ",
               Verbosity => Verbosity);

         when Not_Run =>
            Put_Line
              (Spaces & "- [ ]" & Scen_Kind & Link_Image & " not run  ",
               Verbosity => Verbosity);
      end case;

   end Put_Scenario_Result;

   -- --------------------------------------------------------------------------
   overriding
   procedure Put_Step (Writer : Markdown_Writer; Step : Step_Type'Class) is
   begin
      Put_Line
        (Line (Step.Location)'Image
         & ": Step """
         & (+Step.Data.Src_Code)
         & """");
   -- Put_Line (Step'Image);
   end Put_Step;

   overriding
   procedure Explain (Writer : Markdown_Writer; Step : Step_Type'Class) is
   begin
      Put_Line
        (Line (Step.Location)'Image
         & ": Step """
         & (+Step.Data.Src_Code)
         & """");
      Put_Line (Inline_Image (Step));
   end Explain;

   overriding
   procedure Put_Scenario_Title (Writer : Markdown_Writer; S : String) is
   begin
      Put_Line ("#### " & S);
   end Put_Scenario_Title;

   overriding
   procedure Put_Feature_Title (Writer : Markdown_Writer; S : String) is
   begin
      Put_Line ("### " & S);
   end Put_Feature_Title;

   overriding
   procedure Put_Document_Title (Writer : Markdown_Writer; S : String) is
   begin
      Put_Line ("## " & S);
   end Put_Document_Title;

end BBT.Writers.Markdown_Writers;
