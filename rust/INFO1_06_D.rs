use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(1).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    let a = idt[0];

    println!("{}", (a == 2) || (a == 3) || (a == 5) || (a == 7));
}
