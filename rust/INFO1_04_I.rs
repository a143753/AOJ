use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::<i32>::new();

    reader.lock().lines().take(2).for_each(|line| {
        let d = line.unwrap().parse::<i32>().unwrap();
        idt.push(d);
    });

    let a = idt[0];
    let b = idt[1];

    println!("{}", a - (a / b) * b);
}
