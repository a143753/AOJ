use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(4).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    let a = idt[0];
    let b = idt[1];
    let c = idt[2];
    let d = idt[3];

    println!("{}", (a == b) && (c == d));
}
