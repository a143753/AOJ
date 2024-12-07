use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(3).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    println!("{}", idt[2]);
    println!("{}", idt[1]);
    println!("{}", idt[0]);
}
