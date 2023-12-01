const fs = require('fs');

const inputContent = Buffer.from(fs.readFileSync('./AOC-2023-01-A-Input')).toString();
const cleanInput = inputContent.replace(/[a-zA-z]/g, '');
const inputsArray = cleanInput.split('\n');

let totalInput = 0;

for (let i = 0; i < inputsArray.length; i++) {
    const inputArray = inputsArray[i].split('');
    if (inputArray.length > 0) {
        const firstDigit = inputArray[0];
        const lastDigit = inputArray[inputArray.length - 1];
        const input = parseInt(`${firstDigit}${lastDigit}`);
        totalInput += input;
    }
}

console.log(totalInput);