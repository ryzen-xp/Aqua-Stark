use core::traits::Into;
use achievement::types::task::{Task, TaskTrait};


#[derive(Copy, Drop)]
pub enum AquaAchievement {
    None,
    FirstFish,
    EventExplorer,
    Breeder,
    Collector,
    Decorator,
}

#[generate_trait]
pub impl AquaAchievementImpl of AquaAchievementTrait {
    #[inline]
    fn identifier(self: AquaAchievement) -> felt252 {
        match self {
            AquaAchievement::None => 0,
            AquaAchievement::FirstFish => 'FirstFish',
            AquaAchievement::EventExplorer => 'EventExplorer',
            AquaAchievement::Breeder => 'Breeder',
            AquaAchievement::Collector => 'Collector',
            AquaAchievement::Decorator => 'Decorator',
        }
    }

    #[inline]
    fn hidden(self: AquaAchievement) -> bool {
        match self {
            AquaAchievement::Decorator => true,
            _ => false,
        }
    }

    #[inline]
    fn index(self: AquaAchievement) -> u8 {
        self.into()
    }

    #[inline]
    fn points(self: AquaAchievement) -> u16 {
        match self {
            AquaAchievement::FirstFish => 10,
            AquaAchievement::EventExplorer => 15,
            AquaAchievement::Breeder => 20,
            AquaAchievement::Collector => 30,
            AquaAchievement::Decorator => 25,
            _ => 0,
        }
    }

    #[inline]
    fn group(self: AquaAchievement) -> felt252 {
        'AquaStark'
    }

    #[inline]
    fn icon(self: AquaAchievement) -> felt252 {
        match self {
            AquaAchievement::FirstFish => 'fa-fish',
            AquaAchievement::EventExplorer => 'fa-binoculars',
            AquaAchievement::Breeder => 'fa-dna',
            AquaAchievement::Collector => 'fa-layer-group',
            AquaAchievement::Decorator => 'fa-paint-brush',
            _ => '',
        }
    }

    #[inline]
    fn title(self: AquaAchievement) -> felt252 {
        match self {
            AquaAchievement::FirstFish => 'First Catch',
            AquaAchievement::EventExplorer => 'Explorer',
            AquaAchievement::Breeder => 'Hatch Master',
            AquaAchievement::Collector => 'Fish Collector',
            AquaAchievement::Decorator => 'Home Designer',
            _ => '',
        }
    }

    #[inline]
    fn description(self: AquaAchievement) -> ByteArray {
        match self {
            AquaAchievement::FirstFish => "You obtained your first fish NFT!",
            AquaAchievement::EventExplorer => "You joined your first aquarium event.",
            AquaAchievement::Breeder => "You bred a new fish successfully.",
            AquaAchievement::Collector => "You own at least 10 unique fish.",
            AquaAchievement::Decorator => "You placed 3 or more decorations in your aquarium.",
            _ => "",
        }
    }

    #[inline]
    fn tasks(self: AquaAchievement) -> Span<Task> {
        match self {
            AquaAchievement::FirstFish => array![
                TaskTrait::new('FirstFish', 1, "Get your first fish."),
            ]
                .span(),
            AquaAchievement::EventExplorer => array![
                TaskTrait::new('EventExplorer', 1, "Attend an aquarium event."),
            ]
                .span(),
            AquaAchievement::Breeder => array![TaskTrait::new('Breeder', 1, "Breed one fish.")]
                .span(),
            AquaAchievement::Collector => array![
                TaskTrait::new('Collector', 10, "Own 10 unique fish."),
            ]
                .span(),
            AquaAchievement::Decorator => array![
                TaskTrait::new('Decorator', 3, "Place 3 aquarium decorations."),
            ]
                .span(),
            _ => [].span(),
        }
    }

    #[inline]
    fn data(self: AquaAchievement) -> ByteArray {
        ""
    }
}

pub impl IntoAquaAchievementU8 of Into<AquaAchievement, u8> {
    #[inline]
    fn into(self: AquaAchievement) -> u8 {
        match self {
            AquaAchievement::None => 0,
            AquaAchievement::FirstFish => 1,
            AquaAchievement::EventExplorer => 2,
            AquaAchievement::Breeder => 3,
            AquaAchievement::Collector => 4,
            AquaAchievement::Decorator => 5,
        }
    }
}

pub impl IntoU8AquaAchievement of Into<u8, AquaAchievement> {
    #[inline]
    fn into(self: u8) -> AquaAchievement {
        match self {
            0 => AquaAchievement::None,
            1 => AquaAchievement::FirstFish,
            2 => AquaAchievement::EventExplorer,
            3 => AquaAchievement::Breeder,
            4 => AquaAchievement::Collector,
            5 => AquaAchievement::Decorator,
            _ => AquaAchievement::None,
        }
    }
}
