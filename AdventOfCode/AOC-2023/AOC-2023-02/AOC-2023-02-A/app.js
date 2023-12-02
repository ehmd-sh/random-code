const fs = require('fs');

const inputs = fs.readFileSync('./AOC-2023-02-A-Input', {encoding: 'utf-8'}).toString().split('\n');

let total = 0;

for (let i = 0; i < inputs.length; i++) {
    let input = inputs[i];
    let game_id = parseInt(input.split(':')[0].split(' ')[1]);
    let game_cubes = input.split(':')[1].split(';');

    let game_playable = true;

    for (let j = 0; j < game_cubes.length; j++) {
        let game_cubes_input = game_cubes[j].split(',');
        
        let total_cubes_this_round = {
            red: 0,
            green: 0,
            blue: 0
        };
        for (let k = 0; k < game_cubes_input.length; k++) {
            const color = game_cubes_input[k].replace(' ', '').split(' ')[1];
            const amount = game_cubes_input[k].replace(' ', '').split(' ')[0];

            total_cubes_this_round[color] = amount;
        }

        if (total_cubes_this_round.red > 12 || total_cubes_this_round.green > 13 || total_cubes_this_round.blue > 14) game_playable = false;
    }

    if (game_playable) total += game_id;
}

console.log(total);