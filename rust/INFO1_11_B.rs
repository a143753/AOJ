use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let binding = line.unwrap();
        let dt = binding.split_whitespace().collect::<Vec<_>>();

        dt.iter().rev().for_each(|dt| {
            println!("{}", dt);
        });
    });
}
