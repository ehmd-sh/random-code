const fs = require('fs');

const inputs = fs.readFileSync('./AOC-2023-02-B-Input', {encoding: 'utf-8'}).toString().split('\n');

let total = 0;

for (let i = 0; i < inputs.length; i++) {
    let input = inputs[i];
    let game_id = parseInt(input.split(':')[0].split(' ')[1]);
    let game_cubes = input.split(':')[1].split(';');

    console.log(game_cubes);

    let max_cubes_this_round = {
        red: 0,
        blue: 0,
        green: 0
    };

    for (let j = 0; j < game_cubes.length; j++) {
        let game_cubes_this_round = game_cubes[j].split();


        for (let k = 0; k < game_cubes_this_round.length; k++) {
            let game_cubes_this_show = game_cubes_this_round[k].split(',');

            let cube_total_this_show = {
                red: 0,
                blue: 0,
                green: 0
            };

            for (let l = 0; l < game_cubes_this_show.length; l++) {
                const color = game_cubes_this_show[l].replace(' ', '').split(' ')[1];
                const amount = game_cubes_this_show[l].replace(' ', '').split(' ')[0];

                cube_total_this_show[color] = parseInt(amount);
            }

            if (cube_total_this_show.red > max_cubes_this_round.red) max_cubes_this_round.red = cube_total_this_show.red;
            if (cube_total_this_show.blue > max_cubes_this_round.blue) max_cubes_this_round.blue = cube_total_this_show.blue;
            if (cube_total_this_show.green > max_cubes_this_round.green) max_cubes_this_round.green = cube_total_this_show.green;    
        }
    }

    console.log(JSON.stringify(max_cubes_this_round));

    const power = (max_cubes_this_round.red > 0 ? max_cubes_this_round.red : 1) * (max_cubes_this_round.blue > 0 ? max_cubes_this_round.blue : 1) * (max_cubes_this_round.green > 0 ? max_cubes_this_round.green : 1);

    total += power;
}

console.log(total);