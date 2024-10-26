const smallAOrd = codepoint('a');
const smallZOrd = codepoint('z');

const bigAOrd = codepoint('A');
const bigZOrd = codepoint('Z');

function gimmePassword()
    println("Введите смещение");
    offset = parse(Int64, readline());

    trueOffset = mod(offset, smallZOrd - smallAOrd + 1);

    rawPassword = "";

    for i in smallAOrd:1:smallZOrd
        rawPassword = rawPassword * (Char)(i);
    end;

    password = rawPassword[trueOffset + 1:length(rawPassword)] * rawPassword[1:trueOffset];

    return password;
end;

lowerCasePassword = gimmePassword();
upperCasePassword = uppercase(lowerCasePassword);

println("Введите строку для шифрования");
unshieldedString = readline();

shieldedString = "";

for i in 1:1:length(unshieldedString)
    if (occursin(unshieldedString[i], lowerCasePassword))
        global shieldedString = shieldedString * lowerCasePassword[codepoint(unshieldedString[i]) - smallAOrd + 1];
    elseif (occursin(unshieldedString[i], upperCasePassword))
        global shieldedString = shieldedString * upperCasePassword[codepoint(unshieldedString[i]) - bigAOrd + 1];
    else
        global shieldedString = shieldedString * unshieldedString[i];
    end;
end;

println(shieldedString);

