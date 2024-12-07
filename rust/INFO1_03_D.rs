use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::<i32>::new();

    reader.lock().lines().take(1).for_each(|line| {
        idt = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<i32>>();
    });

    println!("{} {} {} {}", idt[3], idt[2], idt[1], idt[0]);
}
