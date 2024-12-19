use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<i32>().unwrap();
    });

    reader.lock().lines().take(n as usize).for_each(|line| {
        let binding = line.unwrap();
        let dt = binding.split_whitespace().collect::<Vec<_>>();

        println!("{}", dt.join(" "));
    });
}
