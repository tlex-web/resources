'Author: Tim Lui
'Ownership: Avega S.à.r.l.
'Be careful: The script has no error handling in place
'If you provide the wrong file names, you cannot unhide the sheets

Option Explicit

Private Sub ViewHide_Click()

    'Declare variables
    Dim cols As String
    Dim i As Integer
    Dim sheetNames() As String
    
    'Declare the names manually
    sheetNames = Split("02_Applications_&_systems,03_Pivot_PBC", ",")
    
    'Select columns
    cols = "F:H"

    If ViewHide.Value = True Then
        
        'Hide the selected sheets
        For i = LBound(sheetNames) To UBound(sheetNames)
        
            Sheets(sheetNames(i)).Visible = xlSheetVeryHidden
            
            If cols <> vbNullString Then
                Application.ActiveSheet.Columns(cols).Hidden = True
            End If
        Next i
            
    Else
        
        'Unhide the selected sheets
        For i = LBound(sheetNames) To UBound(sheetNames)
        
            Sheets(sheetNames(i)).Visible = xlSheetVisible
            
            If cols <> vbNullString Then
                Application.ActiveSheet.Columns(cols).Hidden = False
            End If
        Next i
    End If
End Sub