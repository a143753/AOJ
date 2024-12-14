use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = 0;

    reader.lock().lines().take(1).for_each(|line| {
        idt = line.unwrap().parse::<i32>().unwrap();
    });

    (0..idt).for_each(|_| {
        (0..idt).for_each(|_| {
            print!("#");
        });
        println!();
    });
}
