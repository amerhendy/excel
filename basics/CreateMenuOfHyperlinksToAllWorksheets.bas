Attribute VB_Name = "Module3"
Sub CreateMenuOfHyperlinksToAllWorksheets()
    Dim objSheet As Worksheet

    ActiveWorkbook.Sheets.Add(Before:=Worksheets(1)).Name = "Sheet Menu"
    Range("A1").Select

    For Each objSheet In ActiveWorkbook.Worksheets
        If ActiveSheet.Name <> objSheet.Name Then
           ActiveCell.Hyperlinks.Add Anchor:=Selection, Address:="", SubAddress:="'" & objSheet.Name & "'" & "!A1", TextToDisplay:=objSheet.Name
           ActiveCell.Offset(1, 0).Select
           ActiveCell.EntireColumn.AutoFit
        End If
    Next objSheet

    With ActiveSheet
         .Rows(1).Insert
         .Cells(1, 1) = "MENU"
         .Cells(1, 1).Font.Bold = True
         .Cells(1, 1).Font.Size = 14
         .Cells(1, 1).Columns.AutoFit
    End With
End Sub
