use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let dt = line.unwrap().split_whitespace().collect::<Vec<_>>();

        println!("{:?}", dt);
    });

    //    println!("{} {} {}", idt[4], idt[3], idt[2]);
    //    println!("{} {}", idt[1], idt[0]);
}
