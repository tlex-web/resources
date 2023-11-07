Sub FillUniqueRandomNumbers()
    Dim cell As Range
    Dim lowerBound As Long, upperBound As Long, seed As Long
    Dim numbers As Collection
    Dim candidate As Long, i As Long

    ' Retrieve bounds and seed from the cells relative to the active cell
    seed = Sheets("procedure").Range("K29").Value ' Seed is in the active cell
    lowerBound = 1 ' Lower bound is in the cell below the active cell
    upperBound = 13 ' Upper bound is in the two cells below the active cell
    
    If IsEmpty(seed) Or seed = 0 Then
        MsgBox "Error: No seed number provided."
        Exit Sub
    End If
    
    ' Check if the range is valid
    If upperBound < lowerBound Then
        MsgBox "Error: Upper bound must be greater than lower bound."
        Exit Sub
    End If

    If upperBound - lowerBound + 1 < Selection.Cells.Count Then
        MsgBox "Error: Range too small for the number of unique numbers requested."
        Exit Sub
    End If

    ' Initialize the random number generator with the seed
    Randomize seed

    Set numbers = New Collection

    ' Generate unique random numbers
    Do While numbers.Count < Selection.Cells.Count
        candidate = Int((upperBound - lowerBound + 1) * Rnd + lowerBound)
        On Error Resume Next
        numbers.Add candidate, CStr(candidate)
        If Err.Number = 0 Then
            ' Successfully added new unique number
        Else
            ' Duplicate found, clear the error and try another number
            Err.Clear
        End If
        On Error GoTo 0 ' Reset error handling
    Loop

    ' Fill the selection with unique random numbers
    i = 1
    For Each cell In Selection
        cell.Value = numbers(i)
        i = i + 1
    Next cell
End Sub

