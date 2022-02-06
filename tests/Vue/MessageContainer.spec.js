import MessageContainer from '../../resources/js/components/MessageContainer.vue';
import { mount } from '@vue/test-utils';
   
describe('MessageContainer', ()=>{
    test('Wraps MessageDisplay component', ()=>{
        let wrapper = mount(MessageContainer, {
            stubs: {
                MessageDisplay: {
                    template: `<p data-testid="message">Hello from the db!</p>`
                },
            }
        });

        let message = wrapper.find('[data-testid="message"]').element.textContent;
        expect(message).toEqual('Hello from the db!')
    })  
})