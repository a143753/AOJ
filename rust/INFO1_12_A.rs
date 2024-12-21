use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut nm = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        nm = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect();
    });
    let n = nm[0];
    let _m = nm[1];

    let mut array = Vec::new();
    reader.lock().lines().take(n as usize).for_each(|line| {
        let dt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<_>>();
        array.push(dt);
    });

    let mut ij = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        ij = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect();
    });
    let i = ij[0];
    let j = ij[1];

    println!("{}", array[i as usize][j as usize]);
}
