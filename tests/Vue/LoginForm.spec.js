import LoginForm from '../../resources/js/components/LoginForm.vue';
import { mount } from '@vue/test-utils';

describe('LoginForm', () => {
    test('Emits an event with a user data payload.', async () => {
        let wrapper = mount(LoginForm);
        //find the text input
        //let nameInput = wrapper.find('input[type="text"]')
        // let nameInput = wrapper.find('[data-testid="name-input"]')

        //set value for text input
       //nameInput.setValue('FooBar')
        wrapper.setData({
            name: 'FooBar',
        })
        //simulate submission
        //await wrapper.trigger('submit') 
        await wrapper.vm.onSubmit()
        //assert event has been emitted
        let emittedEvent = wrapper.emitted('formSubmitted');
        await expect(emittedEvent).toBeTruthy();
        //assert payload is correct 
        expect(emittedEvent[0][0].name).toBe('FooBar');
    });
});