#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

struct Node{
    int x;   
    struct Node* next;
};

struct Node* createNode(int x){
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->x = x;
    newNode->next = NULL;
    return newNode;
}

void printList(struct Node* head){
    struct Node* temp = head;
    while(temp != NULL) {
        printf("%d ", temp->x);
        temp = temp->next;
    }
    printf("\n");
}

struct Node* reverseList(struct Node* head){
    struct Node* pre = NULL;
    struct Node* cur = head;
    struct Node* nex = NULL;
    while(cur != NULL) {
        nex = cur->next; 
        cur->next = pre;
        pre = cur;
        cur = nex;
    }
    return pre;
}

int main() {
    struct Node* head = createNode(5);
    head->next = createNode(3);
    head->next->next = createNode(7);
    head->next->next->next = createNode(2);

    printList(head); 
    for(int i = 0; i < 3; i++){
        printf("Reversing Linked List...\n");
        sleep(1); 
    }
    struct Node* reversed = reverseList(head);
    printList(reversed);

    return 0;
}
