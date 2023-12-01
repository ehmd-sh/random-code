const fs = require('fs');

const file = fs.readFileSync('./input.txt').toString();
const inputs = file.split('\n');

const digits = {
    nine: 9,
    eight: 8,
    seven: 7,
    six: 6,
    five: 5,
    four: 4,
    three: 3,
    two: 2,
    one: 1
}

const alphaDigs = {
    one: 'oonee',
    two: 'ttwoo',
    three: 'tthreee',
    four: 'ffourr',
    five: 'ffivee',
    six: 'ssixx',
    seven: 'ssevenn',
    eight: 'eeightt',
    nine: 'nninee'
}

let total = 0;

for(let i = 0; i < inputs.length; i++) {
    let input = inputs[i];
    for (let k = 0; k < Object.keys(alphaDigs).length; k++) {
        const alpha= Object.keys(alphaDigs)[k];
        const dig = alphaDigs[alpha];

        const alphaDigR = new RegExp(alpha, 'g');
        input = input.replaceAll(alphaDigR, dig);
    }

    for (let j = 0; j < Object.keys(digits).length; j++) {
        const alpha = Object.keys(digits)[j];
        const digit = digits[alpha];

        const alphaDigit = new RegExp(alpha, 'g');
        input = input.replaceAll(alphaDigit, digit);
    }
    input = input.replaceAll(/[a-zA-Z]/g, '');
    input = input.split('');
    const firstDigit = parseInt(input[0]);
    const lastDigit = parseInt(input[input.length - 1]);
    input = ((firstDigit*10) + lastDigit);

    total += input;    
}

console.log(total);