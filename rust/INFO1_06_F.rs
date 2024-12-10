use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = Vec::new();

    reader.lock().lines().take(3).for_each(|line| {
        let str = line.unwrap();
        idt.push(str.parse::<i32>().unwrap());
    });

    let a = idt[0] != 0;
    let b = idt[1] != 0;
    let c = idt[2] != 0;

    println!("{}", !(a && b) || c);
}
