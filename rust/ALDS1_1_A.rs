fn print_vec(a: Vec<i32>) {
    println!(
        "{}",
        a.iter()
            .map(|x| x.to_string())
            .collect::<Vec<String>>()
            .join(" ")
    );
}

fn insertion_sort(a: Vec<i32>) -> Vec<i32> {
    let mut a = a;
    for i in 1..a.len() {
        print_vec(a.clone());

        let v = a[i];
        let mut j = i as i32 - 1;
        while j >= 0 && a[j as usize] > v {
            a[(j + 1) as usize] = a[j as usize];
            j -= 1;
        }
        a[(j + 1) as usize] = v;
    }
    a
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let _ = buf.trim().parse::<usize>().unwrap();
    buf.clear();

    std::io::stdin().read_line(&mut buf).unwrap();
    let a: Vec<i32> = buf
        .trim()
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let a = insertion_sort(a);

    print_vec(a);
}
