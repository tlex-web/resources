Function CheckNameFormat(nameStr As String) As Boolean
    Dim parts() As String
    Dim firstName As String
    Dim middleName As String
    Dim lastName As String
    Dim i As Integer
    
    ' Define a regular expression pattern to match names
    Dim regexPattern As String
    regexPattern = "^[A-Za-z]+\s(?:[A-Za-z]+\s)?[A-Za-z]+$"
    
    ' Check if the name matches the regular expression
    If Not RegExTest(nameStr, regexPattern) Then
        CheckNameFormat = False
        Exit Function
    End If
    
    ' Split the name into parts using spaces
    parts = Split(nameStr, " ")
    
    ' Check if the name has at least a first name and last name
    If UBound(parts) < 1 Then
        CheckNameFormat = False
        Exit Function
    End If
    
    ' Extract first name
    firstName = parts(0)
    
    ' Extract last name
    lastName = parts(UBound(parts))
    
    ' If there's a middle name, extract it
    If UBound(parts) > 1 Then
        middleName = ""
        For i = 1 To UBound(parts) - 1
            middleName = middleName & parts(i) & " "
        Next i
        middleName = Trim(middleName)
    End If
    
    ' Check if the name parts are not empty and don't contain numbers/alphanumeric characters
    If firstName = "" Or lastName = "" Then
        CheckNameFormat = False
    ElseIf Not IsAlphaOnly(firstName) Or Not IsAlphaOnly(middleName) Or Not IsAlphaOnly(lastName) Then
        CheckNameFormat = False
    Else
        ' Check if the name doesn't contain excluded words
        If Not ContainsExcludedWords(nameStr) Then
            CheckNameFormat = True
        Else
            CheckNameFormat = False
        End If
    End If
End Function

Function IsAlphaOnly(str As String) As Boolean
    Dim i As Integer
    Dim char As String
    
    IsAlphaOnly = True
    
    For i = 1 To Len(str)
        char = Mid(str, i, 1)
        If Not (char Like "[A-Za-z]") Then
            IsAlphaOnly = False
            Exit Function
        End If
    Next i
End Function

Function RegExTest(ByVal strInput As String, ByVal strPattern As String) As Boolean
    Dim objRegEx As Object
    Set objRegEx = CreateObject("VBScript.RegExp")

    With objRegEx
        .Global = True
        .MultiLine = True
        .IgnoreCase = True
        .Pattern = strPattern
    End With

    RegExTest = objRegEx.Test(strInput)
End Function

Function ContainsExcludedWords(ByVal strInput As String) As Boolean
    Dim excludedWords() As String
    Dim word As Variant
    
    ' Define excluded words
    excludedWords = Split("admin service backup", " ")
    
    For Each word In excludedWords
        If InStr(1, strInput, word, vbTextCompare) > 0 Then
            ContainsExcludedWords = True
            Exit Function
        End If
    Next word
    
    ContainsExcludedWords = False
End Function