use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::<i32>::new();

    reader.lock().lines().take(2).for_each(|line| {
        let t = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<i32>().unwrap())
            .collect::<Vec<i32>>();

        idt.append(&mut t.clone());
    });

    println!("{} {} {}", idt[4], idt[3], idt[2]);
    println!("{} {}", idt[1], idt[0]);
}
