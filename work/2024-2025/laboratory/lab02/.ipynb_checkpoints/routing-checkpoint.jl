println("Введите пароль");
pass = lowercase(readline());
sortedPass = join(sort(collect(pass)));

numberOfColumn = [];
lengthOfPass = length(pass);

for i in 1:2:length(sortedPass) * 2
    push!(numberOfColumn, (Int64)((findfirst(sortedPass[i], pass) - 1) / 2 + 1));
end;

println("Строку к шифрованию (без пробелов и других символов кроме кириллицы)");
rawString = lowercase(readline());

encodedString = "";

numberOfRaws = ceil(length(rawString) / lengthOfPass);

while length(rawString) < (numberOfRaws * lengthOfPass)
    global rawString *= 'а'; # заглушка для количества символов
end;

for i in numberOfColumn
    current = i;
    while (current <= length(rawString))
        global encodedString *= rawString[2 * current - 1];
        current += lengthOfPass;
    end;
end;

println(encodedString);