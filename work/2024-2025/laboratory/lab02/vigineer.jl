const abcStart = codepoint('а');
const abcEnd = codepoint('я');

println("Введите пароль");
pass = lowercase(readline());

# Работает при условии только кириллицы, без других символов
println("Введите строку для шифрования");
rawString = lowercase(readline());

encodedString = "";

while (length(pass) < length(rawString))
    global pass *= pass;
end;

for i in 1:2:2 * length(rawString)
    global encodedString *= (Char)(abcStart - 1 + mod(codepoint(rawString[i]) + codepoint(pass[i]) - 2 * abcStart + 1, abcEnd - abcStart)); 
end;

println(encodedString);