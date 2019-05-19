pub mod graph {
    use graph_items::edge::Edge;
    use graph_items::node::Node;
    use std::collections::HashMap;

    trait Attrible {
        fn attrs(&self) -> HashMap<String, String>;

        fn get_attr(&self, attr: &str) -> String {
            self.attrs().get(attr).unwrap().to_string()
        }
    }

    #[derive(PartialEq, Debug)]
    pub struct Graph {
        pub nodes: Vec<Node>,
        pub edges: Vec<Edge>,
        pub attrs: HashMap<String, String>,
    }

    impl Graph {
        pub fn new() -> Self {
            Self {
                nodes: vec![],
                edges: vec![],
                attrs: HashMap::new(),
            }
        }

        pub fn with_nodes(mut self, nodes: &Vec<Node>) -> Self {
            for x in nodes {
                self.nodes.push(x);
            }
            self
        }

        pub fn with_edges(&self, edges: &Vec<Edge>) -> Self {
            unimplemented!("Graph.with_edges");
        }

        pub fn with_attrs(&self, attrs: &[(&str, &str)]) -> Self {
            unimplemented!("Graph.with_attrs");
        }

        pub fn get_node(&self, content: &str) -> &Node {
            unimplemented!("Graph.get_node");
        }
    }

    pub mod graph_items {
        pub mod node {
            use std::collections::HashMap;

            #[derive(PartialEq, Debug)]
            pub struct Node {
                pub content: String,
                pub attrs: HashMap<String, String>,
            }

            impl Node {
                pub fn new(content: &str) -> Self {
                    Self {
                        content: content.to_owned(),
                        attrs: HashMap::new(),
                    }
                }

                pub fn with_attrs(&self, attrs: &[(&str, &str)]) -> Self {
                    unimplemented!("Node.with_attrs");
                }

                pub fn expect(&self, str: &str) -> Self {
                    unimplemented!("Node.expect");
                }

                pub fn get_attr(&self, attr: &str) -> Option<&str> {
                    match self.attrs.get(attr) {
                        Some(s) => Some(s),
                        None => None,
                    }
                }
            }
        }

        pub mod edge {
            #[derive(PartialEq, Debug)]
            pub struct Edge {
                pub attrs: Vec<String>,
            }

            impl Edge {
                pub fn new(from: &str, to: &str) -> Self {
                    unimplemented!("Edge::new");
                }

                pub fn with_attrs(&self, attrs: &[(&str, &str)]) -> Self {
                    unimplemented!("Edge.with_attrs");
                }
            }
        }
    }
}
